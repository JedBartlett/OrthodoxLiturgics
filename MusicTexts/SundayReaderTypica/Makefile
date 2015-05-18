file_base = SundayReaderTypica

lily_command    = lilypond-book --pdf --include=../../../../texmf/tex
booklet_command = pdfjam --suffix booklet --landscape --booklet=true --keepinfo=true --paper letterpaper

sed_tablet  = sed 's/SZWAST_TEXT_PT/10pt/g' | sed 's/SZWAST_PAPER_WIDTH/5in/g' | sed 's/SZWAST_PAPER_HEIGHT/7in/g' | sed 's/SZWAST_LILYPOND_STAFFSIZE/15/g' | sed 's/SZWAST_MARGIN_WIDTH/0.25in/g'
sed_booklet = sed 's/SZWAST_TEXT_PT/10pt/g' | sed 's/SZWAST_PAPER_WIDTH/5.5in/g' | sed 's/SZWAST_PAPER_HEIGHT/8.5in/g' | sed 's/SZWAST_LILYPOND_STAFFSIZE/15/g' | sed 's/SZWAST_MARGIN_WIDTH/0.75in/g'
sed_letter  = sed 's/SZWAST_TEXT_PT/14pt/g' | sed 's/SZWAST_PAPER_WIDTH/8.5in/g' | sed 's/SZWAST_PAPER_HEIGHT/11in/g' | sed 's/SZWAST_LILYPOND_STAFFSIZE/20/g' | sed 's/SZWAST_LILYPOND_LINEWIDTH/5.2\in/g' | sed 's/SZWAST_MARGIN_WIDTH/1in/g'

sed_pentecost = sed 's/SZWAST_SEASON/Pentecost/g'
sed_pascha    = sed 's/SZWAST_SEASON/Pascha/g'
sed_lent      = sed 's/SZWAST_SEASON/Lent/g'
sed_ascension = sed 's/SZWAST_SEASON/Ascension/g'

docs    = Hours Typica
seasons = pentecost pascha lent ascension
formats = tablet booklet letter


# @brief Create rules to make work directories for each season-format.
# @param[in]	format
define format_specific_rules
$(1): pentecost-$(1)

endef

$(foreach format, $(formats), $(eval $(call format_specific_rules,$(format))))


# @brief Create rules for lytex files
# @param[in]	season
# @param[in]	format
define both_specific_rules
out.$(1)-$(2)/exists.txt:
	(cd out.$(1)-$(2) || mkdir out.$(1)-$(2)) && touch out.$(1)-$(2)/exists.txt

out.$(1)-$(2)/$(file_base).lytex: out.$(1)-$(2)/exists.txt $(file_base).pretex
	cat $(file_base).pretex | $(sed_$(2)) | $(sed_$(1)) > out.$(1)-$(2)/$(file_base).lytex

out.$(1)-$(2)/liturgy.lytex: out.$(1)-$(2)/exists.txt
	cat ~/texmf/tex/liturgy.pretex | $(sed_$(2)) | $(sed_$(1)) > out.$(1)-$(2)/liturgy.lytex

out.$(1)-$(2)/$(file_base).tex: out.$(1)-$(2)/$(file_base).lytex out.$(1)-$(2)/liturgy.lytex
	cd out.$(1)-$(2) && $(lily_command) $(file_base).lytex

out.$(1)-$(2)/$(file_base).pdf: out.$(1)-$(2)/$(file_base).tex
	cd out.$(1)-$(2) && pdflatex $(file_base)
	cd out.$(1)-$(2) && pdflatex $(file_base)

$(file_base)-$(1)-$(2).pdf: out.$(1)-$(2)/$(file_base).pdf
ifeq ($(2),booklet)
	cp out.$(1)-$(2)/$(file_base).pdf out.$(1)-$(2)/$(file_base)-$(1).pdf
	$(booklet_command) out.$(1)-$(2)/$(file_base)-$(1).pdf
else
	cp out.$(1)-$(2)/$(file_base).pdf ./$(file_base)-$(1)-$(2).pdf
endif

$(1)-$(2): $(file_base)-$(1)-$(2).pdf

endef

$(foreach season, $(seasons), \
  $(foreach format, $(formats), \
    $(eval $(call both_specific_rules,$(season),$(format)))))

# Build all seasons by default
all: $(seasons)

# Each season deponds on all of its formats
define seasons_template
$(1): $(foreach format, $(formats),$(1)-$(format))

endef

$(foreach season, $(seasons), $(eval $(call seasons_template,$(season))))


#pentecost: $(formats)

#tablet: out.tablet/exists.txt
#	cat SundayReaderTypica.pretex | $(sed_tablet) | $(sed_pentecost) > out.tablet/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_tablet) | $(sed_pentecost) > out.tablet/liturgy.lytex
#	cd out.tablet && $(lily_command) SundayReaderTypica.lytex
#	cd out.tablet && pdflatex SundayReaderTypica
#	cd out.tablet && pdflatex SundayReaderTypica
#	cp out.tablet/SundayReaderTypica.pdf ./SundayReaderTypica-tablet.pdf

#booklet: out.booklet/exists.txt
#	cat SundayReaderTypica.pretex | $(sed_booklet) | $(sed_pentecost) > out.booklet/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_booklet) | $(sed_pentecost) > out.booklet/liturgy.lytex
#	cd out.booklet && $(lily_command) SundayReaderTypica.lytex
#	cd out.booklet && pdflatex SundayReaderTypica
#	cd out.booklet && pdflatex SundayReaderTypica
#	$(booklet_command) out.booklet/SundayReaderTypica.pdf

#letter: out.letter/exists.txt
#	cat SundayReaderTypica.pretex | $(sed_letter) | $(sed_pentecost) > out.letter/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_letter) | $(sed_pentecost) > out.letter/liturgy.lytex
#	cd out.letter && $(lily_command) SundayReaderTypica.lytex
#	cd out.letter && pdflatex SundayReaderTypica
#	cd out.letter && pdflatex SundayReaderTypica
#	cp out.letter/SundayReaderTypica.pdf .

#pascha: pascha-tablet pascha-booklet pascha-letter

#pascha-tablet: out.tablet/exists.txt
#	cat SundayReaderTypica.pretex | $(sed_tablet) | $(sed_pascha) > out.tablet/SundayReaderTypica-pascha.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_tablet) | $(sed_pentecost) > out.tablet/liturgy-pascha.lytex
#	cd out.tablet && $(lily_command) SundayReaderTypica-pascha.lytex
#	cd out.tablet && pdflatex SundayReaderTypica-pascha
#	cd out.tablet && pdflatex SundayReaderTypica-pascha
#	cp out.tablet/SundayReaderTypica-pascha.pdf ./SundayReaderTypica-pascha-tablet.pdf

#pascha-booklet: out.booklet.txt
#	cat SundayReaderTypica.pretex | $(sed_booklet) | $(sed_pascha) > out.booklet/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_booklet) | $(sed_pentecost) > out.booklet/liturgy.lytex
#	cd out.booklet && $(lily_command) SundayReaderTypica.lytex
#	cd out.booklet && pdflatex SundayReaderTypica
#	cd out.booklet && pdflatex SundayReaderTypica
#	$(booklet_command) out.booklet/SundayReaderTypica.pdf

#pascha-letter:
#	cd out.pascha-letter || mkdir out.pascha-letter
#	cat SundayReaderTypica.pretex | $(sed_letter) | $(sed_pascha) > out.pascha-letter/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_letter) | $(sed_pentecost) > out.pascha-letter/liturgy.lytex
#	cd out.pascha-letter && $(lily_command) SundayReaderTypica.lytex
#	cd out.pascha-letter && pdflatex SundayReaderTypica
#	cd out.pascha-letter && pdflatex SundayReaderTypica
#	cp out.pascha-letter/SundayReaderTypica.pdf ./SundayReaderTypica-pascha.pdf

#lent: lent-tablet lent-booklet lent-letter

#lent-tablet:
#	cd out.lent-tablet || mkdir out.lent-tablet
#	cat SundayReaderTypica.pretex | $(sed_tablet) | $(sed_lent) > out.lent-tablet/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_tablet) | $(sed_pentecost) > out.lent-tablet/liturgy.lytex
#	cd out.lent-tablet && $(lily_command) SundayReaderTypica.lytex
#	cd out.lent-tablet && pdflatex SundayReaderTypica
#	cd out.lent-tablet && pdflatex SundayReaderTypica
#	cp out.lent-tablet/SundayReaderTypica.pdf ./SundayReaderTypica-lent-tablet.pdf

#lent-booklet:
#	cd out.lent-booklet || mkdir out.lent-booklet
#	cat SundayReaderTypica.pretex | $(sed_booklet) | $(sed_lent) > out.lent-booklet/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_booklet) | $(sed_pentecost) > out.lent-booklet/liturgy.lytex
#	cd out.lent-booklet && $(lily_command) SundayReaderTypica.lytex
#	cd out.lent-booklet && pdflatex SundayReaderTypica
#	cd out.lent-booklet && pdflatex SundayReaderTypica
#	$(booklet_command) out.lent-booklet/SundayReaderTypica.pdf

#lent-letter:
#	cd out.lent-letter || mkdir out.lent-letter
#	cat SundayReaderTypica.pretex | $(sed_letter) | $(sed_lent) > out.lent-letter/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_letter) | $(sed_pentecost) > out.lent-letter/liturgy.lytex
#	cd out.lent-letter && $(lily_command) SundayReaderTypica.lytex
#	cd out.lent-letter && pdflatex SundayReaderTypica
#	cd out.lent-letter && pdflatex SundayReaderTypica
#	cp out.lent-letter/SundayReaderTypica.pdf ./SundayReaderTypica-lent.pdf

#ascension: ascension-tablet ascension-booklet ascension-letter

#ascension-tablet:
#	cd out.ascension-tablet || mkdir out.ascension-tablet
#	cat SundayReaderTypica.pretex | $(sed_tablet) | $(sed_ascension) > out.ascension-tablet/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_tablet) | $(sed_pentecost) > out.ascension-tablet/liturgy.lytex
#	cd out.ascension-tablet && $(lily_command) SundayReaderTypica.lytex
#	cd out.ascension-tablet && pdflatex SundayReaderTypica
#	cd out.ascension-tablet && pdflatex SundayReaderTypica
#	cp out.ascension-tablet/SundayReaderTypica.pdf ./SundayReaderTypica-ascension-tablet.pdf

#ascension-booklet:
#	cd out.ascension-booklet || mkdir out.ascension-booklet
#	cat SundayReaderTypica.pretex | $(sed_booklet) | $(sed_ascension) > out.ascension-booklet/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_booklet) | $(sed_pentecost) > out.ascension-booklet/liturgy.lytex
#	cd out.ascension-booklet && $(lily_command) SundayReaderTypica.lytex
#	cd out.ascension-booklet && pdflatex SundayReaderTypica
#	cd out.ascension-booklet && pdflatex SundayReaderTypica
#	$(booklet_command) out.ascension-booklet/SundayReaderTypica.pdf

#ascension-letter:
#	cd out.ascension-letter || mkdir out.ascension-letter
#	cat SundayReaderTypica.pretex | $(sed_letter) | $(sed_ascension) > out.ascension-letter/SundayReaderTypica.lytex
#	cat ~/texmf/tex/liturgy.pretex | $(sed_letter) | $(sed_pentecost) > out.ascension-letter/liturgy.lytex
#	cd out.ascension-letter && $(lily_command) SundayReaderTypica.lytex
#	cd out.ascension-letter && pdflatex SundayReaderTypica
#	cd out.ascension-letter && pdflatex SundayReaderTypica
#	cp out.ascension-letter/SundayReaderTypica.pdf ./SundayReaderTypica-ascension.pdf

clean:
	rm -rf out.*
	rm SundayReaderTypica*.pdf
