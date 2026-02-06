# Getting Started

## Clone the Basic Book Builder


> [!cli] Clone the repository
> ```
> git clone https://github.com/jehaverlack/basic-book-builder.git
> ```


> [!cli] Navigate to the repo directory
> ```
> cd basic-book-builder
> ```

## Setting Up Build Environment


> [!caution] ~Debian Linux
> This script only support Debian based Linux system (e.g Debian, Ubuntu, Zorin).  And this script will install several ATP packages on your system.


> [!danger] Warning
This script **has not** been widely tested across many platforms


To initialize your systems build environment run:

> [!cli] Setup Build Environment
> ```
> ./scripts/setup-linux-deb.sh
> ```

### Non deb systems

For more information on setting up the build environment for your system see: **TBD: NEEDS DOCUMENTED**.

## Testing

Once you have set up your build environment, you test by building the **basic book builder**.

> [!cli] Testing Build Environment
> ```
> make all
> ```

## Creating a New Project


> [!proposed] Tip
> You do not want to edit your new project document in the `basic-book-builder` directory.  You will want to create a **new project** for your document based on this template.


> [!cli] Create a new project
> ```
> ./scripts/new-project.sh <NEW_PROJECT_DIR>
> ```


```
cd <NEW_PROJECT_DIR>
```


Update your project configuration:

1. Edit: `metadata.yaml`, for title, author, etc
2. Edit: `templates/pandoc.yaml`
3. Open:  `<NEW_PROJECT_DIR>`  with Obsidian, and edit `chapters` documents.
4. Build:  `make pdf`


> [!warning] Warning
>   `<NEW_PROJECT_DIR>`  should be outside of the **basic-book-builder** directory

## Building

### PDF

```
make pdf
```

> NOTE: Building the PDF also builds the **LaTeX** version of the book.

### HTML

```
make html
```

### DocX

```
make docx
```

> NOTE: DocX is a work in progress.  Frontmatter and formatting need work.

### ODT

```
make odt
```

> NOTE: ODT is a work in progress. Frontmatter and formatting need work.

### Make All

To build all supported formats

```
make all
```

