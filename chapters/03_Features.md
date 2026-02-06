# Features

## Metadata

Metadata for the project is managed in `metadata.yaml`.  Edit this file to make global changes to variables for your document.  Changes here will propagate to all format builds.

## Front-matter

Front matter content is manged in:

- `templates/frontmatter.tex`
- `templates/frontmatter.html`
- `templates/frontmatter-md.html`


> [!caution] Tip
 Unfortunately when you edit one, you need to edit the respective changes to the other front-matter formats.
### Title Page

Edit the **Front-matter** files to modify the formatting of the Title Page.

> [!caution] Tip
> You'll need to modify the HTML / LaTex.

### Meta Data Page

Edit the **Front-matter** files to modify the 2nd page Metadata format.

### Cover Illustration

Edit the **Front-matter** files to optionally un-comment the Cover Art Acknowledgement.

- This is disabled by default

### Dedication


Edit the **Front-matter** files to modify un-comment the Book Dedication.

- This is disabled by default
## Table of Contents

## Chapters

Chapter Markdown source files are located in the `chapters` directory.  Edit the `template\pandoc.yaml` file to control which chapter markdown files are in what order.

## Appendixes

TBD

## Glossary

TBD

## Index

TBD

### Markdown Indexes

TBD

## Bibliography

TBD

### Zotero Integration

TBD

### Obsidian Citations

TBD

## Mathjax Equations

TBD

### Left Justified / Inline

TBD

### Centered

TBD

## Custom Markdown

TBD

### Call-outs

A few call-out box styles have been custom added to easily highlight certain types of content.

> [!code] Markdown Example
> ```
> [!established] Green Call-out Title
> A green box
> ```

Will render:

> [!established] Green Call-out Title
> A green box

---

> [!code] Markdown Example
> ```
> [!proposed] Blue Call-out Title
> A blue box
> ```

Will render:

> [!proposed] Blue Call-out Title
> A blue box

---

> [!code] Markdown Example
> ```
> [!speculative] Purple Call-out Title
> A purple box
> ```

Will render:

> [!speculative] Purple Call-out Title
> A purple box

---

> [!code] Markdown Example
> ```
> [!caution] Caution Note
> Beware of this section.  AKA a orange box.
> ```

Will render:

> [!caution] Caution Note
> Beware of this section.  AKA a orange box.

---

> [!code] Markdown Example
> ```
> [!warning] Warning Note
> Same as the Caution Box
> ```

Will render:

> [!warning] Warning Note
> Same as the Caution Box

---

> [!code] Markdown Example
> ```
> [!danger] Alert
> A slightly stronger warning.  AKA a red box.
> ```

Will render:

> [!danger] Alert
> A slightly stronger warning.  AKA a red box.

---

> [!code] Markdown Example
> ```
> [!code] Code Block
> '''
> if [ true ]; do
> 	echo "The Cow Jumps over the Moon"
> fi
> '''
> ```

Will render:

> [!code] Code Block
> ```
> if [ true ]; do
> 	echo "The Cow Jumps over the Moon"
> fi
> ```

---

> [!code] Markdown Example
> ```
> [!cli] Command line
> A command line example
>'''
>$ ls
>build  chapters  conf  filters  lib  LICENSE.md  Makefile  metadata.yaml  >README.md  scripts  templates
> '''
> ```

Will render:

> [!cli] Command line
> A command line example
> ```
> $ ls
> build  chapters  conf  filters  lib  LICENSE.md  Makefile  metadata.yaml  README.md  scripts  templates
> ```






