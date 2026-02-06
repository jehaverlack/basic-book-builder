# Design

## Directory Structure

The **basic-book-builder** directory tree.

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

The **basic-book-builder**  configuration files, scripts, and build files.

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


> [!caution] About conf
> NEVER: edit file directly in `conf`.  They will be overwritten by the build process.
### Metadata

Update the `metadata.yaml` file to globally configure your document title and other metadata.  Edit this file to control your document title, author, etc.

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
```

## Build Workflow

For a PDF Build:

```
make pdf
```

will build dependencies on these file:

1. Makefile
2. conf/pandoc.yaml
3. conf/pdf.yaml
4. lib/zotero.bib
5. chapters/*.md

NOTE:  the `Makefile` will copy `templates/*.yaml` to `conf/*.yaml`.  **Never** edit `conf/*`directly.