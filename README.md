# Orthodox Liturgics

## Layout Strategy

The music should be separated into its own pure `.ly` file with no layout.
If desired, that music can be arranged for engraving into a standalone score
for sharing the music directly.
The music can then be incorporated directly into a lualatex book.

Examples of this are shown where [DemoMusic.ly](./DemoMusic.ly) is used by both:
[DemoScore.ly](./DemoScore.ly) and [DemoBook.ly](./DemoBook.ly).

## Instructions for Creating PDFs

### Compiling Music/Score Alone

The simplest way to develop music, is to open and edit it directly with
the WYSIWYG-ish [frescobaldi](http://frescobaldi.org/download.html) editor for lilypond.
Just do all of the development with that tool, and then, once the music and score
look right, it can be embedded into a lualatex book

### Compiling a book

Any of the books can be compiled with LaTeX installed using the lualatex compiler,
as long as the `lyluatex` extension has been installed and made available to the compiler.

For example, the DemoBook can be compiled by running
`lualatex DemoBook.tex`
