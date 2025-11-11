# Getting Started


## Installing Pre-Requisites

For Debian / ZorinOS and likely Ubuntu based systems.

> [!caution] TODO
> It would be nice to roll a setup script to take care of this.

### Required

#### Pandoc

- https://pandoc.org/
- [Download](https://github.com/jgm/pandoc/releases/tag/3.8.2.1)

```
sudo apt install https://github.com/jgm/pandoc/releases/download/3.8.2.1/pandoc-3.8.2.1-1-amd64.deb
```

#### Code Editor

> [!established] Code Editor
> [VSCodium](https://vscodium.com/) is recommend for privacy (telemetry/tracking) reasons
> - https://vscodium.com/

But any text editor will work.
#### make

```
sudo apt install make
```

#### jq and yq

```
sudo apt install jq yq
```

#### texlive

```
sudo apt install texlive texlive-xetex texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra
```


#### MathJax

- https://www.mathjax.org/

```
wget https://registry.npmjs.org/mathjax/-/mathjax-3.2.2.tgz
tar xzf mathjax-3.2.2.tgz
mv package/es5/* lib/mathjax
rm -rf package mathjax-3.2.2.tgz
```

> [!caution] TODO
> This need to be rolled into a setup script.



### Optional

The following are not strictly requires to use this book builder template.

#### Obsidian

> [!established] Highly Recommended
> Editing book chapter content in Obsidian is a very productive means for editing Markdown source content.

- https://obsidian.md/
- [Deb Package](https://github.com/obsidianmd/obsidian-releases/releases/download/v1.9.14/obsidian_1.9.14_amd64.deb)

```
sudo apt install https://github.com/obsidianmd/obsidian-releases/releases/download/v1.9.14/obsidian_1.9.14_amd64.deb
```

#### Zotero

> [!established] Highly Recommended
> If you need to managed citations and references, Zotero integration is highly recommended.


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

##### Better BibTex for Zotero

Install the Better BibTex Plugin for Zotero
-  Zotero > Tool > Plugins


##### Export citations.bib

- Zotero > File > Export Library > Format: Better BibTeX
- [ ] Keep Updated
- [ ] Save to:  ~/Documents/Lib/zotero.bib
- [ ] Symlink your ~/Documents/Lib/Citations.bib to basic-book-builder/lib/zotero.bib

##### Zotero Connector Browser Plugin

- https://chromewebstore.google.com/detail/zotero-connector/ekhagklcjbdpajgpjgmbionohlpdbjgc

Provides you the ability to auto add Web resources to your Zotero citation database.

#### lmodern

```
sudo apt install lmodern
```

#### epubcheck

```
sudo apt install epubcheck
```

#### foliate

An EPub Reader

- https://johnfactotum.github.io/foliate/

```
sudo apt install https://github.com/johnfactotum/foliate/releases/download/2.6.4/com.github.johnfactotum.foliate_2.6.4_all.deb
```

#### calibre

An EPub Reader

- https://calibre-ebook.com

```
sudo apt install calibre
```


## Editing the Configuration

# Editing the Book

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
