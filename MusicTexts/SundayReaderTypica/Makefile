#  This Makefile is currently very Linux specific.  I envision CMake as the best
# candidate for cross-platform compatibility.

# The base name of the document being generated.
# Extensions and suffixes will be appended to this name to address source,
# intermediate, and final files.
file_base = SundayReaderTypica

# Modifications are made to the service text during the Lenten and Paschal
# seasons.  4 varieties exist:
#   pentecost  The default, standard text used from Pentecost to the beginning
#              of Lent
#   lent       Extra segments are added during Lent
#   pascha     Many segments are dropped and/or replaced with "Christ is Risen"
#              during the 40 days of Pascha
#   ascension  Some parts that are dropped during Pascha are not restored until
#              Pentecost, while others are restored at Ascension Thursday, this
#              is for the one Sunday between.
seasons = pentecost pascha lent ascension
# Three different format sizes are supported by this make file.
#   tablet   This is layed out for a screen size of about 8" (halfway between
#            7" and 9") with a ratio between the 4x3 and 16x9 standards.  A
#            simple compromize between many common tablet screen sizes.
#   booklet  This is layed out on halves of letter paper, so the whole bundle
#            can be folded in half to make a 5.5x8.5 booklet.  This layout
#            is intended for individuals not in the choir to hold.
#   letter   This is layed out on full letter paper with a larger font.  This
#            format is intended to sit on choir stands and shared by multiple
#            choir members.
formats = tablet booklet letter

# Targets:
#   There will be 12 primary targets in this makefile, one document for each
# combination of season and format.  Secondary targets are provided for making
# combinations of targets.  Each primary target is of the form
# "<season>-<format>", such as "pentecost-letter" and "pascha-tablet".
#   In a CMake adaptation, I envision each of these primary targets as a "build
# configuration" choice.  Each requiring its own build directory.

# This command will be run from in a working directory.  One extra ../ is needed
# to address the Common directory with the .ly files.
lily_command = lilypond-book --pdf --include=../../Common --loglevel=ERROR

# The current command to generate the booklets.
#   This is a final processing step for the booklet format that has no
# counterpart for letter and tablet.  pdfjam is a Linux program that also works
# on Mac.  Running it in Windows requires Cygwin.  All it is, is a set of
# convenience wrapper scripts around the LaTeX pdfpages package.  We should be
# able to replace this with direct usage of pdfpages to get cross-platform
# building.
booklet_command = pdfjam --suffix booklet --landscape --booklet=true --keepinfo=true --paper letterpaper

# These commands engage sed (a predominately Linux program) to replace specific
# placeholders in the pretex files with dimensions.  The dimensions are
# dependent on the format.  It is imperative that the commands be of the form
# "sed_<format>" to work with the programatically generated rules that invoke
# them.
#   In a CMake adaptation, I envision using CMake's "configure" counterpart to
# do these text replacements.
sed_tablet  = sed 's/SZWAST_TEXT_PT/10pt/g' | sed 's/SZWAST_PAPER_WIDTH/5in/g' | sed 's/SZWAST_PAPER_HEIGHT/7in/g' | sed 's/SZWAST_LILYPOND_STAFFSIZE/15/g' | sed 's/SZWAST_MARGIN_WIDTH/0.25in/g'
sed_booklet = sed 's/SZWAST_TEXT_PT/10pt/g' | sed 's/SZWAST_PAPER_WIDTH/5.5in/g' | sed 's/SZWAST_PAPER_HEIGHT/8.5in/g' | sed 's/SZWAST_LILYPOND_STAFFSIZE/15/g' | sed 's/SZWAST_MARGIN_WIDTH/0.75in/g'
sed_letter  = sed 's/SZWAST_TEXT_PT/14pt/g' | sed 's/SZWAST_PAPER_WIDTH/8.5in/g' | sed 's/SZWAST_PAPER_HEIGHT/11in/g' | sed 's/SZWAST_LILYPOND_STAFFSIZE/20/g' | sed 's/SZWAST_LILYPOND_LINEWIDTH/5.2\in/g' | sed 's/SZWAST_MARGIN_WIDTH/1in/g'

# Similar to the format sed commands above, these replace the season definition
# placeholder in the pretex file with the season name.  This sets the value of a
# LaTeX variable that is checked during the processing of seasonally variant
# sections to determine the proper text to include.
#   In a CMake adaptation, I envision using CMake's "configure" counterpart to
# do these text replacements.
sed_pentecost = sed 's/SZWAST_SEASON/Pentecost/g'
sed_pascha    = sed 's/SZWAST_SEASON/Pascha/g'
sed_lent      = sed 's/SZWAST_SEASON/Lent/g'
sed_ascension = sed 's/SZWAST_SEASON/Ascension/g'

# By default, build standard text in all formats.
default: pentecost


#   Create shortcut targets of the form "<format>" which will build the
# "pentecost-<format>" documents.  Thus "make letter" or "make tablet" will be
# able to make the default letter or tablet sized documents respectively.
# @param[in]	format
define format_specific_rules
$(1): pentecost-$(1)

endef

# The lack of space before "$(format)" as the parameter to the macro above is
# very important.  With a space it would try to create targets like "letter"
# dependent on "pentecost- letter" instead of "pentecost-letter"
$(foreach format, $(formats), $(eval $(call format_specific_rules,$(format))))


# @brief Create rules for lytex files
# @param[in]	season
# @param[in]	format
# @details
#   This defines the sequence of events that generate each primary target pdf.
define both_specific_rules
# This rule generates a working directory of the form "out.<season>-<format>".
out.$(1)-$(2)/exists.txt:
	(cd out.$(1)-$(2) || mkdir out.$(1)-$(2)) && touch out.$(1)-$(2)/exists.txt

# This creates a Lytex (lilypond-book source) file from the pretex file.  It
# uses the sed commands above to replace the placeholder texts with actual
# values and writes the resulting lytex document into the working directory.
out.$(1)-$(2)/$(file_base).lytex: out.$(1)-$(2)/exists.txt $(file_base).pretex
	cat $(file_base).pretex | $(sed_$(2)) | $(sed_$(1)) > out.$(1)-$(2)/$(file_base).lytex

# This rule runs the file of common liturgy snippets through the same sed
# commands so they can be formatted for the desired season and format.
out.$(1)-$(2)/liturgy.lytex: out.$(1)-$(2)/exists.txt
	cat ../Common/liturgy.pretex | $(sed_$(2)) | $(sed_$(1)) > out.$(1)-$(2)/liturgy.lytex

# This runs lilypond-book on the generated lytex file in the working directory.
out.$(1)-$(2)/$(file_base).tex: out.$(1)-$(2)/$(file_base).lytex out.$(1)-$(2)/liturgy.lytex
	cd out.$(1)-$(2) && $(lily_command) $(file_base).lytex

# This generates the pdf from the output of lilypond.  Run it twice to get all
# the cross-references and table of contents correct.
out.$(1)-$(2)/$(file_base).pdf: out.$(1)-$(2)/$(file_base).tex
	cd out.$(1)-$(2) && pdflatex -interaction=batchmode $(file_base)
	cd out.$(1)-$(2) && pdflatex -interaction=batchmode $(file_base)

# This rule puts the final pdf in the original directory, out of the working
# directory.  For non-booklet formats just copy the output from pdflatex.  For
# booklet targets, run it through pdfjam.
$(file_base)-$(1)-$(2).pdf: out.$(1)-$(2)/$(file_base).pdf
ifeq ($(2),booklet)
	cp out.$(1)-$(2)/$(file_base).pdf out.$(1)-$(2)/$(file_base)-$(1).pdf
	$(booklet_command) out.$(1)-$(2)/$(file_base)-$(1).pdf
else
	cp out.$(1)-$(2)/$(file_base).pdf ./$(file_base)-$(1)-$(2).pdf
endif

# This created the actual "<season>-<format>" targets that cause the final PDFs
# to be built.
$(1)-$(2): $(file_base)-$(1)-$(2).pdf

endef

# Again, the lack of spaces in the macro parameters are crucial.  See above.
$(foreach season, $(seasons), \
  $(foreach format, $(formats), \
    $(eval $(call both_specific_rules,$(season),$(format)))))

# Build all texts in all formats
all: $(seasons)

# Each season deponds on all of its formats
define seasons_template
$(1): $(foreach format, $(formats),$(1)-$(format))

endef

$(foreach season, $(seasons), $(eval $(call seasons_template,$(season))))

# clean deletes all working directories and all final PDFs.
clean:
	rm -rf out.*
	rm SundayReaderTypica*.pdf
