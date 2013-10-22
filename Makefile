tex:
	pdflatex cs-ug-hbk.tex
	pdflatex cs-ug-hbk.tex

html:
	/bin/rm -rf html
	mkdir html
	latex2html -split 4 -long_titles 4 -rootdir html -no_navigation cs-ug-hbk-11-12.tex

clean:
	/bin/rm *.aux *.log *.out *.toc *~

booklet:
	./make-booklet cs-ug-hbk.pdf

flowcharts:	/dev/null
	pdftoppm -r 600 diagrams/bs-cs.pdf | pnmtopng > diagrams/bs-cs.png
	pngtopnm diagrams/bs-cs.png | pnmfile
	pdftoppm -r 600 diagrams/ba-cs.pdf | pnmtopng > diagrams/ba-cs.png
	pngtopnm diagrams/ba-cs.png | pnmfile
	pdftoppm -r 600 diagrams/bs-cpe.pdf | pnmtopng > diagrams/bs-cpe.png
	pngtopnm diagrams/bs-cpe.png | pnmfile
