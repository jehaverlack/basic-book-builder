# basic-book-builder (b3)

| Attribute | Value |
| --- | --- |
| **Author** | John Haverlack |
| **Copyright** | 2026 John Haverlack |
| **License** | CC BY-ND 4.0 |
| **Version** | 1.2.2 |
| **Date** | 2026-02-05 |

This is a basic book (article) builder template based on a Pandoc build process in conjunction with a number of other tools to generate PDF, DOCX, ODT, HTML, LaTeX, Markdown, and Epub book formats all from a single set of Markdown source content in an Obsidian vault.

## Usage

#### PDF

```
make pdf
```

> NOTE: Building the PDF also builds the **LaTeX** version of the book.

#### HTML

```
make html
```

#### DocX

```
make docx
```

> NOTE: DocX is a work in progress

#### ODT

```
make odt
```

> NOTE: ODT is a work in progress

#### Other Formats

- **Markdown** is a work in progress
- **EPub** is a work in progress


## Getting Started

Download PDF or HTML version of the b3 book.  Which self documents how to use this template:
- [basic-book-builder.pdf ](build/pdf/basic-book-builder.pdf)
- [basic-book-builder.html](build/html/basic-book-builder.html)

### Clone Repo

```
git clone https://github.com/jehaverlack/basic-book-builder.git
```

```
cd basic-book-builder
```

### Setup Build Environment

> NOTE: For Debian based systems.

```
scripts/setup-linux-deb.sh
```


### Testing Build Environment

```
make all
```

If this succeeds you have a build environment.

## Create a New Project

```
./scripts/new-project.sh <PATH_TO_PROJECT>
```

```
cd <PATH_TO_PROJECT>
```

**Update Config Files**:

1. `metadata.yaml`
2. `templates/pandoc.yaml`
3. Edit Chapter Content
4. Build your book


