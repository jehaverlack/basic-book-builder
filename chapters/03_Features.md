# Features

The basic book builder template integrates feature from many systems including Pandoc, MathJax, Obsidian, and Zotero.   The following list covers these features from a functional point of view.

## Metadata

Metadata for the project is managed in `metadata.yaml`.  Edit this file to make **global changes** to variables for your document.  Definitions in `metadata.yaml` will propagate to all format builds.

## Front-matter

Front-Matter documents control the Title Page, Metadata and other pages before the Title of Contents.  Front matter content is manged in these files:

- `templates/frontmatter.tex`
- `templates/frontmatter.html`
- `templates/frontmatter-md.html`

Unfortunately when you edit one, you need to edit the respective changes to the other front-matter formats.
### Title Page

Edit the **Front-matter** files to modify the formatting of the Title Page.  You'll need to modify the HTML / LaTex code.

### Meta Data Page

Edit the **Front-matter** files to modify the 2nd page Metadata format and fields to display.

### Cover Illustration

Edit the **Front-matter** files to optionally un-comment the Cover Art Acknowledgement.

- This is disabled by default

### Dedication

Edit the **Front-matter** files to modify un-comment the Book Dedication.

- This is disabled by default


## Table of Contents

The table of contents is auto generated.  But can be disabled in `template\pandoc.yaml` by setting:
- `toc: false`

## Chapters

Chapter Markdown source files are located in the `chapters` directory.  To edit which chapter files are included the document:

 - Edit the `input-file:` section of the `template\pandoc.yaml`

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

## Images

You can use basic Markdown Images


```
![ACEP](lib/img/ACEPLogo.png)
```



![ACEP](lib/img/ACEPLogo.png)


## *LaTeX* Equations

You can embed LaTeX equations directly in your Markdown pages.

### Left Justified / Inline

To left justify *LaTex* surround the code inside single `$`:   


> [!code] Left Justified Equation
> ```
> $x = \frac{1}{2}$
> ```

$x = \frac{1}{2}$

> [!code] Inline
> ```
> Or inline, $x = \frac{1}{2}$, in a sentence.
> ```

Or inline, $x = \frac{1}{2}$, in a sentence.


### Centered

To center justify *LaTex* surround the code inside double `$$`:   

> [!code] Centered Equation
> ```
> $$x = \frac{1}{2}$$
> ```

$$x = \frac{1}{2}$$


## Custom Markdown

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
>build  chapters  conf  filters  lib  LICENSE.md  Makefile
>metadata.yaml  >README.md  scripts  templates
> '''
> ```

Will render:

> [!cli] Command line
> A command line example
> ```
> $ ls
> build  chapters  conf  filters  lib  LICENSE.md  Makefile
> metadata.yaml  README.md  scripts  templates
> ```


## Advanced 

### Changing Fonts

It is possible to change fonts by editing `templates/pandoc.yaml`, and `templates\styles.css`, but you will have to make sure you have the proper font's installed on your system first.

### Adding Filters

Custom filters can be created.  This is complicated and typically needs done in 3 places for:

- obsidian
- *LaTeX*
- HTML




