#
# makefile for J2 TVAC
#

report_mn: report_mn.pdf

report_mn.pdf: report_mn.tex crisdefs.tex Makefile \
        02-*/*.pdf harvest_02-??/*.pdf 
	pdflatex report_mn.tex -interaction nonstopmode || \
	rm report_mn.pdf 2> /dev/null || true

show: report_mn.pdf
	evince report_mn.pdf > /dev/null 2>&1 &

clean:
	rm *.aux *.log *.nav *.out *.snm *.toc *.vrb 2> /dev/null || true

