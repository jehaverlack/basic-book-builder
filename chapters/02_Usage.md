# Basic Usage

## Creating a Project

To create a new Project based on the Basic Book Builder template:

1. Run the new-project.sh script.
```
./scripts/new-project.sh <PATH_TO_PROJECT>
```

-  <PATH_TO_PROJECT>  should be outside of the **basic-book-builder** directory

```
cd <PATH_TO_PROJECT>
```

Update:

1. `metadata.yaml`
2. `templates/pandoc.yaml`

> [!info] Suggestion
> Create a git repository to version control your new  <PATH_TO_PROJECT> content.

## Editing Content

Edit your source content Markdown under the `chapters` directory.

**Optional**

- Open your `<PATH_TO_PROJECT>` directory as an Obsidian vault.
- Edit your Markdown with Obsidian

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

