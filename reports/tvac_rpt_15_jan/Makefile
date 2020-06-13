#
# makefile for J2 TVAC
#

report: report.pdf

report.pdf: report.tex crisdefs.tex figures/*.png Makefile
	pdflatex report.tex -interaction nonstopmode || \
	rm report.pdf 2> /dev/null || true

