PANDOC = pandoc
BASE = conf/pandoc.yaml

all: pdf epub html latex markdown

pdf:
	@mkdir -p build
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/pdf.yaml conf/pdf.yaml
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.tex conf/frontmatter.tex
	$(PANDOC) --defaults=$(BASE) --defaults=conf/pdf.yaml

epub:
	@mkdir -p build/media
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/epub.yaml conf/epub.yaml
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.html conf/frontmatter.html
	$(PANDOC) --defaults=$(BASE) --defaults=conf/epub.yaml

html:
	@mkdir -p build/lib/img build/lib/mathjax build/conf
	cp -r lib/img build/lib/
	cp -r lib/diag build/lib/
	cp -r lib/mathjax build/lib/
	cp conf/style.css build/conf/
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/html.yaml conf/html.yaml
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.html conf/frontmatter.html
	$(PANDOC) --defaults=$(BASE) --defaults=conf/html.yaml

latex:
	@mkdir -p build
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/latex.yaml conf/latex.yaml
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.tex conf/frontmatter.tex
	$(PANDOC) --defaults=$(BASE) --defaults=conf/latex.yaml

markdown:
	@mkdir -p build
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/markdown.yaml conf/markdown.yaml
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter-md.html conf/frontmatter-md.html
	$(PANDOC) --defaults=$(BASE) --defaults=conf/markdown.yaml

clean:
	rm -rf build
