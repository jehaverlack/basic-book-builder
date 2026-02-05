# Appendix B: Editing the Book

### Configuration

There are a number of other config files for each format:

```
conf/
├── epub-metadata.xml
├── epub_template.html
├── epub.yaml
├── frontmatter_epub.md
├── frontmatter_epub.xhtml
├── frontmatter.html
├── frontmatter.tex
├── header.tex
├── html.yaml
├── latex.yaml
├── markdown.yaml
├── metadata.yaml
├── pandoc.yaml
├── pdf.yaml
├── style.css
└── style_epub.css

```

#### Main Config Files

- metadata.yaml - Set Title, etc
- pandoc.yaml - Main Pandoc Config
#### Per format Configs
 - `pdf.yaml`
 - `html.yaml`
 - `latex.yaml`
 - `epub.yaml`

### FrontMatter Config

There are 2 Version of the FrontMatter for PDF, and HTML bases formats that set the Title, Author, Verizon, Copyright, etc...

- `frontmatter.tex`
- `frontmatter.html`
- `frontmatter_epub.*`  - Work in Progress

> There is probably a better way to do this.

## Editing the Content

To edit the book open the `basic-book-builder` directory as an Obsidian Vault.

- Edit the Markdown content in the `chapters` directory.

### Citations

> Note:   the Zotero database needs configured to export automatically to `lib/citations.bib`

To insert a Zotero Citation 
- Ensure the Zotero App and DB are running on you system.
- Alt + I   (to insert citation)
- Search for and select citation reference

## Usage: Building the Book

#### PDF

```
make pdf
```

#### HTML

```
make html
```

#### LaTex

```
make latex
```

#### Markdown

```
make markdown
```

#### EPub

> Note:  This ePub configuration still needs tuning.

```
make epub
```
