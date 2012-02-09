tex:
	pdflatex cs-ug-hbk-11-12.tex
	pdflatex cs-ug-hbk-11-12.tex

html:
	/bin/rm -rf html
	mkdir html
	latex2html -split 4 -long_titles 4 -rootdir html -no_navigation cs-ug-hbk-11-12.tex

clean:
	/bin/rm *.aux *.log *.out *.toc *~
