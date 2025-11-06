PANDOC = pandoc
BASE = conf/pandoc.yaml

all: build/pdf build/epub build/html

pdf:
	@mkdir -p build
	$(PANDOC) --defaults=$(BASE) --defaults=conf/pdf.yaml

epub:
	@mkdir -p build/media
	$(PANDOC) --defaults=$(BASE) --defaults=conf/epub.yaml

html:
	@mkdir -p build/lib/img build/lib/mathjax build/conf
	cp -r lib/img build/lib/
	cp -r lib/mathjax build/lib/
	cp conf/style.css build/conf/
	$(PANDOC) --defaults=$(BASE) --defaults=conf/html.yaml

latex:
	@mkdir -p build
	pandoc --defaults=$(BASE) --defaults=conf/latex.yaml

clean:
	rm -rf build
