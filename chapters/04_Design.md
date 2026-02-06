# Design

## Directory Structure

```
basic-book-builder
├── build
│   ├── docx
│   ├── html
│   │   ├── conf
│   │   └── lib
│   │       ├── diag
│   │       ├── img
│   │       └── mathjax
│   ├── latex
│   ├── odt
│   └── pdf
├── chapters
├── conf
├── filters
├── lib
│   ├── citations
│   ├── diag
│   ├── img
│   └── mathjax
├── scripts
│   └── tmp
└── templates
```

## Configuration Files


```
../basic-book-builder
├── chapters
├── conf
├── filters
│   ├── callouts-html.lua
│   └── callouts.lua
├── lib
│   ├── diag
│   ├── img
│   └── zotero.bib
├── Makefile
├── metadata.yaml
├── scripts
│   ├── new-project.sh
│   ├── replace-metadata.sh
│   ├── setup-linux-deb.sh
│   └── tmp
└── templates
    ├── docx.yaml
    ├── epub_template.html
    ├── epub.yaml
    ├── frontmatter-docx.md
    ├── frontmatter.html
    ├── frontmatter-md.html
    ├── frontmatter.tex
    ├── header.tex
    ├── html.yaml
    ├── latex.yaml
    ├── markdown.yaml
    ├── odt.yaml
    ├── pandoc.yaml
    ├── pdf.yaml
    ├── style.css
    └── style_epub.css

```


### Metadata

Update the `metadata.yaml` file to globally configure your document title and other metadata.

### Pandoc Main Config

Update the `input-files:` section of `templates/pandoc.yaml` to control what chapter source files are in which order in your document.

```
# pandoc.yaml
input-files:
  # - chapters/Preface.md
  - chapters/00_Introduction.md
  - chapters/01_Getting_Started.md
  - chapters/02_Usage.md
  - chapters/03_Features.md
  - chapters/Appendix.md
  - chapters/AppendixA.md
  # - chapters/AppendixB.md
  - chapters/Glossary.md
  - chapters/Index.md
  - chapters/Bibliography.md

from: markdown+yaml_metadata_block+raw_tex
standalone: true


metadata:
  mainfont: "Noto Serif"
  sansfont: "Noto Sans"
  monofont: "Noto Sans Mono"
  # mainfont: "Libertinus Serif"
  # sansfont: "Libertinus Sans"
  # monofont: "DejaVu Sans Mono"
  date: ""            # <-- forces maketitle to exist, but blank
  link-citations: true

variables:
  documentclass: book     # options: report, book, article
  fontsize: 12pt
  geometry:
    - margin=1in
  toc: true                  # ✅ Pandoc-recognized variable
  toc-depth: 3               # ✅ nested inside variables
  toc-title: "Contents"      # ✅ controls TOC heading
  numbersections: true       # ✅ correct key (not number-sections)
  colorlinks: true           # nice PDF hyperlinks
  linkcolor: blue
  graphics: true
  float: false
  figure-latex-placement: H
  # suppress-chapter: true

resource-path:
  - .
  - lib/img
  - lib/diag

citeproc: true
bibliography: lib/zotero.bi
```

## Build Workflow

TBD