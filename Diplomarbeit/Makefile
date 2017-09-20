all:
	pdflatex diplomarbeit.tex
	bibtex diplomarbeit
	makeglossaries diplomarbeit
	pdflatex diplomarbeit.tex
	pdflatex diplomarbeit.tex

clean: 
	rm -f *.log *.aux *.glo *.bbl *.toc *.blg *.glg *.log *.gls *.lof *.ist *.glsdefs *.out diplomarbeit.pdf
