#
# makefile for J2 TVAC
#

report_pfh: report_pfh.pdf

report_pfh.pdf: report_pfh.tex crisdefs.tex 01-*/*.png Makefile
	pdflatex report_pfh.tex -interaction nonstopmode || \
	rm report_pfh.pdf 2> /dev/null || true

report_pfl: report_pfl.pdf

report_pfl.pdf: report_pfl.tex crisdefs.tex 01-*/*.png Makefile
	pdflatex report_pfl.tex -interaction nonstopmode || \
	rm report_pfl.pdf 2> /dev/null || true

show_pfh: report_pfh.pdf
	evince report_pfh.pdf > /dev/null 2>&1 &

show_pfl: report_pfl.pdf
	evince report_pfl.pdf > /dev/null 2>&1 &

clean:
	rm *.aux *.log *.nav *.out *.snm *.toc *.vrb 2> /dev/null || true

