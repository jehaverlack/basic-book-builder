PANDOC = pandoc
BASE = conf/pandoc.yaml

all: pdf epub html latex markdown

pdf:
	cat chapters/04_Hardware.base.md lib/md/server_comparison.md > chapters/04_Hardware.md
	@mkdir -p build
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.tex conf/frontmatter.tex
	$(PANDOC) --defaults=$(BASE) --defaults=conf/pdf.yaml

epub:
	cat chapters/04_Hardware.base.md lib/md/server_comparison.md > chapters/04_Hardware.md
	@mkdir -p build/media
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.html conf/frontmatter.html
	$(PANDOC) --defaults=$(BASE) --defaults=conf/epub.yaml

html:
	cat chapters/04_Hardware.base.md lib/md/server_comparison.md > chapters/04_Hardware.md
	@mkdir -p build/lib/img build/lib/mathjax build/conf
	cp -r lib/img build/lib/
	cp -r lib/diag build/lib/
	cp -r lib/mathjax build/lib/
	cp conf/style.css build/conf/
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.html conf/frontmatter.html
	$(PANDOC) --defaults=$(BASE) --defaults=conf/html.yaml

latex:
	cat chapters/04_Hardware.base.md lib/md/server_comparison.md > chapters/04_Hardware.md
	@mkdir -p build
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter.tex conf/frontmatter.tex
	$(PANDOC) --defaults=$(BASE) --defaults=conf/latex.yaml

markdown:
	cat chapters/04_Hardware.base.md lib/md/server_comparison.md > chapters/04_Hardware.md
	@mkdir -p build
	@scripts/build-frontmatter.sh conf/metadata.yaml templates/frontmatter-md.html conf/frontmatter-md.html
	$(PANDOC) --defaults=$(BASE) --defaults=conf/markdown.yaml

clean:
	rm -rf build
