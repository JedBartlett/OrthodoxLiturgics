# The Sunday Reader Typica

Here are instructions for building a Sunday Reader Typica PDF.  The Sunday
Reader Typica is a full service book, not just a collection of sheet music.  In
addition to Lilypond, a LaTeX renderer will be required as well as some other
supporting software and LaTeX packages.

## Prerequisites

### Software

These software programs are needed to build the Sunday Reader Typica.

* Lilypond
* Latex
* GNU Make
* sed
* pdfjam

### LaTeX Packages

These extra LaTeX packages are needed and likely not to come by default with a
basic LaTeX installation.

* extsizes
  (for larger fonts in letter size format)
* titlesec
  (for the fancy section and paragraph header formats)
* verse
  (for formatting the Psalms)
* etoolbok
  (for the toggles the choose texts for the seasonal variations)
* boolexpr
  (for the switch statement in the psalm command)
* calc
  (for easy arithmatic on measurement units when setting up page geometry)

These are all easily added using the standard repositories in ubuntu
(and derivatives, kubuntu etc..) with apt-get:
    sudo apt-get install texlive-full

* pgfornament
  (for the fancy border on the cover page and ornaments flanking the page numbers)

### pgfornament

The [pgfornament](http://www.altermundus.com/pages/tkz/ornament/index.html)
LaTeX package is not bundled with texlive.  It will likely need to be installed
manually.

All I had to do in Linux was copy the pgfornament folder from the archive to
/usr/share/texmf/tex/latex then run `texhash /usr/share/texmf` all as root.  The
directions for a MikTex installation in Windows looks similarly simple.

## Building

The building of the Typica service is controlled by the Makefile.  There are
four stages in the generation of a PDF document from the pretex source file.

1. The pretex source file is pre-processed by sed to seed the document with
season- and format-specific values.  This creates the lilypond-book lytex file
in the working directory.
2. Lilypond-book processes the lytex file, converting the lilypond environments
to embedable graphics of the sheet music included into the TeX document.
3. Pdflatex processes the TeX output from lilypond-book and generates a PDF
document.
4. The PDF document is copied from the working directory, converting it to
booklet form if appropriate.

### Seasonal variations

The Typica service is available in four seasonal variants:

* pentecost

  The standard text is used from Pentecost until the start of Lent.

* lent

  The Lenten variations go until Pascha.

* pascha

  The Paschal variations are used until Ascension.

* ascension

  The "Heavenly King" prayer is not reintroduced until after Pentecost, so the
  Sunday after Ascension is slightly unique.

### Formats

The Typica service can be formatted for three different mediums.

* letter

  The letter format is typeset with a larger font size.  It is meant to be
  shared by multiple members of the choir on one stand.

* booklet

  The booklet format is typeset with a smaller font on half letter pages.  It is
  meant to be folded in half into a booklet, after the pages are printed on
  letter paper, double sided.

* tablet

  The tablet format is typeset with almost no margins.  It is meant to be used
  digitally on either a 7- or 9-inch tablet.

### Invoking make

By default, running `make` will cause the service to be generated without
seasonal variants (the pentecost season) in all three formats.

To generate any other seasonal variant invoke make with the season as the
argument: `make lent`, `make pascha`, ...

To generate just one format, invoke make with the format as the argument:
`make letter`, `make tablet`, ...
The "pentecost" season will be generated in only the requested format.
To generate just one format of a specific variant
separate the season and format with a hyphen, "-":
`make pascha-letter`, `make ascension-tablet`, `make lent-booklet`,
...

To generate all seasons in all formats use `make all`.

### Parallel builds

The makefile is set up to make good use of multiple processes.
Build times can be sped up significantly by using make's -j command line option.
