TEXDOC = main
# TEXDOC = wing-baldridge-emnlp2013

all: ${TEXDOC}.pdf

DVIPS = dvips
PS2PDF = ps2pdf
LATEX = pdflatex

# The following command forces everything to be remade always.  This somewhat
# defeats the purpose of a Makefile but is useful here because LaTex insists
# on writing out a result even when an error occurs, which confuses make.

.PHONY: ${TEXDOC}.pdf ${TEXDOC}.dvi

#${TEXDOC}.pdf: ${TEXDOC}.dvi
#	#Yuck, this seems to produce files with size 8.27 by 11.7 in, even
#	#though I explicitly set 'letterpaper' in the \documentclass directive.
#	#dvipdf ${TEXDOC}.dvi
#	${DVIPS} -T 8.5in,11in ${TEXDOC}.dvi
#	${PS2PDF} ${TEXDOC}.ps

${TEXDOC}.pdf: ${TEXDOC}.tex
	${LATEX} ${TEXDOC}
	-bibtex ${TEXDOC}
	${LATEX} ${TEXDOC}
	${LATEX} ${TEXDOC}
