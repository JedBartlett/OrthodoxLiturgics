# Orthodox Liturgics

## Layout Strategy

The music should be separated into its own pure `.ly` file with no layout.
If desired, that music can be arranged for engraving into a standalone score
for sharing the music directly.
The music can then be incorporated directly into a lualatex book.

Examples of this are shown where [DemoMusic.ly](./DemoMusic.ly) is used by both:
[DemoScore.ly](./DemoScore.ly) and [DemoBook.ly](./DemoBook.ly).

Anything in the root directory ending in .tex is assumed to be compiled and published

Recursively anything in any subdirectories ending in `-Score.ly` is assumed to be compiled and published as well as a standalone sheet score.

## Instructions for setting up Development Environment

### Using Visual Studio Code (All Operating Systems)

Visual Studio Code and docker are technically all you need to work in this repository.

1. Clone this repository down using git
2. Install [VSCode for your operating system](
     https://code.visualstudio.com/docs/setup/setup-overview)
3. Install the [Remote-containers extension into VSCode](
      https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
4. Install [docker for your operating system](
     https://code.visualstudio.com/docs/remote/containers) to host the development container.
   - (You may have to re-start after following those steps.)
   - *NOTE: Windows 10 Pro or Enterprise editions, not Home*
5. Open the cloned folder from VSCode (checked out to the correct branch).
   you will be prompted if you want to open using remote containers, say yes.  It will take a while to clone and setup the container the first time.
6. If you need to rebuild the container in VSCode, press `<Ctrl><Shift><P>`
   and start typing in `Remote-Containers` to see options.
   `Re-build and Reopen in Container` will purge the existing development
   environment and rebuild everything if you run into problems,
   (especially when switching branches if the development environment was changed).
7. Open the `DemoBook.tex` file in the root of the repo and press `<Ctrl><s>`
   to save the document, and automatically trigger the build system.
   You should see a compilation begin, and produce a `DemoBook.pdf`.
   This can be opened and previewed in the Visual Studio editor.
8. Explore:
   - Press `<Ctrl><Shift><P>` and type `LaTex` to filter to the latex
     workshop commands (like `Clean up all auxillary files` and
     `Build LaTeX Project`)

## Instructions for Creating PDFs on cmd line (Natively/Manual instructions)

### Compiling Music/Score Alone

The simplest way to develop music, is to open and edit it directly with
the WYSIWYG-ish [frescobaldi](http://frescobaldi.org/download.html) editor for lilypond.
Just do all of the development with that tool, and then, once the music and score
look right, it can be embedded into a lualatex book

### Compiling a book

### TexLive

Recommend use of the [TeXLive distribution of LaTeX](
    https://www.tug.org/texlive/) for all operating systems.

Any of the books can be compiled with LaTeX installed using the lualatex compiler,
as long as the `lyluatex` extension has been installed and made available to the compiler.

For example, the DemoBook can be compiled by running
`lualatex -shell-escape DemoBook.tex`

However, for command-line use, Use the latexmk command-line tool supplied by TeXLive.
This will compile the document the correct number of times to be sure that the references
(index and hyperref references in PDF for page numbers etc) get sorted out properly.

For example, to compile vespers (after installing TeXLive and lualatex) run:
`latexmk -shell-escape -pdf 1-GreatVespers.tex`.
