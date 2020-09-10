# ox-bibtex4export
Simple solution for author-year-style references in Org mode based on a BibTeX-file that export well to LaTeX, html, odt and plain text. I'm sure there is a way to achieve this with [org-ref](https://github.com/jkitchin/org-ref), but since I would be using this package solely for this purpose, I found it easier brewing up my own solution with simple RefTeX and a custom org-link.


## Dependencies
- RefTeX (included in the AUCTeX package for Emacs)
- Org mode (included in Emacs)

## Installation
1. Add `ox-bibtex4export.el` to a directory included in the list `load-path` or modify this list to include the directory with
   `(add-to-list 'load-path "/PATH/TO/ox-bibtex4export/")` in your init file,
2. add `(require 'ox-bibtex4export)` to your init-file,
3. for some reason not clear to me (the variable `org-odt-styles-file` is set correctly by the hook-function) you have include the line `#+ODT_STYLES_FILE: /tmp/odtstyle.xml` in the header of your *.org-file for small-caps to work in odt-export.

## Usage
1. Invoke `M-x org-reftex-citation` (C-c C-x ]) when working in Org mode to insert the custom link.