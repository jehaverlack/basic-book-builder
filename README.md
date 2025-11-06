# beautiful-book-builder

This is a basic book builder template based on a Pandoc build process in conjunction with a number of other tools to generate PDF, ODT, HTML, LaTex, and Epub book formats from Markdown source content in an Obsidian vault.
## Dependencies

For Debian / ZorinOS and likely Ubuntu based systems.

> It would be nice to roll a setup script to take care of this.
#### Zotero

- https://www.zotero.org/

```
sudo cp ./scripts/deps/zotero.list /etc/apt/sources.list.d/
```

```
sudo apt update
```

```
sudo apt install zotero
```

#### Zotero Connector Browser Plugin

- https://chromewebstore.google.com/detail/zotero-connector/ekhagklcjbdpajgpjgmbionohlpdbjgc

Provides you the ability to auto add Web resources to your Zotero citation database.
#### Obsidian

- https://obsidian.md/
- [Deb Package](https://github.com/obsidianmd/obsidian-releases/releases/download/v1.9.14/obsidian_1.9.14_amd64.deb)

```
sudo apt install https://github.com/obsidianmd/obsidian-releases/releases/download/v1.9.14/obsidian_1.9.14_amd64.deb
```
#### Pandoc

- https://pandoc.org/
- [Download](https://github.com/jgm/pandoc/releases/tag/3.8.2.1)

```
sudo apt install https://github.com/jgm/pandoc/releases/download/3.8.2.1/pandoc-3.8.2.1-1-amd64.deb
```
#### make

```
sudo apt install make
```
#### texlive

```
sudo apt install texlive texlive-xetex texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra
```
#### lmodern

```
apt install lmodern
```
#### epubcheck

```
sudo apt install epubcheck
```
#### foliate

- https://johnfactotum.github.io/foliate/

```
sudo apt install https://github.com/johnfactotum/foliate/releases/download/2.6.4/com.github.johnfactotum.foliate_2.6.4_all.deb
```
#### calibre

- https://calibre-ebook.com

```
sudo apt install calibre
```
#### MathJax

- https://www.mathjax.org/

```
wget https://registry.npmjs.org/mathjax/-/mathjax-3.2.2.tgz
tar xzf mathjax-3.2.2.tgz
mv package/es5/* lib/mathjax
rm -rf package mathjax-3.2.2.tgz
```

# Editing the Book

### Configuration

- Edit the `conf/pandoc.yaml` file to add or remove chapter Markdown source `input-files` to the book.

There are a number of other config files for each format:

```
conf
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
├── pandoc.yaml
├── pdf.yaml
├── style.css
└── style_epub.css
```

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

### Editing Content

To edit the book open the `beautiful-book-builder` directory as an Obsidian Vault.

- Edit the Markdown content in the `chapters` directory.

### Citations

> Note:   the Zotero database needs configured to export automatically to `lib/citations.bib`

To insert a Zotero Citation 
- Ensure the Zotero App and DB are running on you system.
- Alt + I   (to insert citation)
- Search for and select citation reference

# Building the Book

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
#### EPub

> Note:  This configuration still needs work.

```
make epub
```
