.PHONY: all bootstrap latex index pdf html markdown clean
PANDOC   = pandoc
XELATEX  = xelatex -interaction=nonstopmode -halt-on-error -file-line-error
BASE     = conf/pandoc.yaml
METADATA = metadata.yaml

# Extract metadata fields
META_NAME     := $(shell sed -n 's/^name:[[:space:]]*//p' $(METADATA))


# ============================================================
# Independent build paths
# ============================================================
LATEX_BUILD    = build/latex
PDF_BUILD      = build/pdf
HTML_BUILD     = build/html
EPUB_BUILD     = build/epub
MD_BUILD       = build/md


all: html pdf markdown


# ---------------------------------------------
# Globals
# ---------------------------------------------
bootstrap:
	mkdir -p conf
	cp -r templates/pandoc.yaml conf/pandoc.yaml
	cp -r templates/style.css conf/style.css
	cp -r templates/style_epub.css conf/style_epub.css



# ---------------------------------------------
# LATEX PHASE (Pandoc → LaTeX)
# ---------------------------------------------
latex: bootstrap
	rm -rf $(LATEX_BUILD)
	mkdir -p $(LATEX_BUILD)/lib/img
	mkdir -p $(LATEX_BUILD)/lib/diag

	# Assets
	cp -r lib/img/*  $(LATEX_BUILD)/lib/img/
	@if [ -d lib/diag ]; then cp -r lib/diag/* $(LATEX_BUILD)/lib/diag/ 2>/dev/null || true; fi

	# Metadata replacement
	@scripts/replace-metadata.sh $(METADATA) templates/header.tex      conf/header.tex
	@scripts/replace-metadata.sh $(METADATA) templates/latex.yaml      conf/latex.yaml
	@scripts/replace-metadata.sh $(METADATA) templates/frontmatter.tex conf/frontmatter.tex

	# Pandoc → LaTeX
	$(PANDOC) \
	  --output=$(LATEX_BUILD)/$(META_NAME).tex \
	  --metadata=output-file:$(META_NAME) \
	  --defaults=$(BASE) --defaults=conf/latex.yaml -t latex

	# XeLaTeX first pass
	cd $(LATEX_BUILD) && $(XELATEX) $(META_NAME).tex

# ---------------------------------------------
# INDEX PHASE
# ---------------------------------------------
index: latex
	cd $(LATEX_BUILD) && \
	  (test -f $(META_NAME).idx && makeindex $(META_NAME) || true)

# ---------------------------------------------
# PDF PHASE (final XeLaTeX runs)
# ---------------------------------------------
pdf: index
	mkdir -p $(PDF_BUILD)

	cd $(LATEX_BUILD) && $(XELATEX) $(META_NAME).tex
	cd $(LATEX_BUILD) && $(XELATEX) $(META_NAME).tex

	cp $(LATEX_BUILD)/$(META_NAME).pdf $(PDF_BUILD)/$(META_NAME).pdf
	@echo "PDF written to: $(PDF_BUILD)/$(META_NAME).pdf"

	open $(PDF_BUILD)/$(META_NAME).pdf

# ============================================================
# HTML
# ============================================================
html: bootstrap
	rm -rf $(HTML_BUILD)
	mkdir -p $(HTML_BUILD)/lib/img $(HTML_BUILD)/lib/diag $(HTML_BUILD)/lib/mathjax $(HTML_BUILD)/conf

	cp -r lib/img      $(HTML_BUILD)/lib/
	cp -r lib/diag     $(HTML_BUILD)/lib/
	cp -r lib/mathjax  $(HTML_BUILD)/lib/
	cp conf/style.css  $(HTML_BUILD)/conf/

	# HTML metadata
	scripts/replace-metadata.sh $(METADATA) templates/html.yaml conf/html.yaml
	scripts/replace-metadata.sh $(METADATA) templates/frontmatter.html conf/frontmatter.html

	# Build HTML
	$(PANDOC) --defaults=$(BASE) --defaults=conf/html.yaml \
		-o $(HTML_BUILD)/$(META_NAME).html

	@echo "Produced $(HTML_BUILD)/$(META_NAME).html"

	open $(HTML_BUILD)/$(META_NAME).html

# ============================================================
# EPUB
# ============================================================
# FIXME:  Needs work before release
#
# epub:
# 	rm -rf $(EPUB_BUILD)
# 	mkdir -p $(EPUB_BUILD)/media

# 	scripts/replace-metadata.sh $(METADATA) templates/epub.yaml conf/epub.yaml
# 	scripts/replace-metadata.sh $(METADATA) templates/frontmatter.html conf/frontmatter.html

# 	$(PANDOC) --defaults=$(BASE) --defaults=conf/epub.yaml \
# 		-o $(EPUB_BUILD)/$(META_NAME).epub

# 	@echo "Produced $(EPUB_BUILD)/$(META_NAME).epub"


# ============================================================
# MARKDOWN
# ============================================================
markdown: bootstrap
	rm -rf $(MD_BUILD)
	mkdir -p $(MD_BUILD)
	cp -r lib/img      $(MD_BUILD)/lib/
	cp -r lib/diag     $(MD_BUILD)/lib/
	cp -r lib/mathjax  $(MD_BUILD)/lib/

	scripts/replace-metadata.sh $(METADATA) templates/markdown.yaml conf/markdown.yaml
	scripts/replace-metadata.sh $(METADATA) templates/frontmatter-md.html conf/frontmatter-md.html

	$(PANDOC) --defaults=$(BASE) --defaults=conf/markdown.yaml \
		-o $(MD_BUILD)/$(META_NAME).md

	@echo "Produced $(MD_BUILD)/$(META_NAME).md"


# ============================================================
# CLEAN
# ============================================================
clean:
	rm -rf build
	rm -rf conf
