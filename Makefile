.PHONY: html

tex:
	pdflatex ba-integration-electives.tex
	pdflatex cs-ug-hbk.tex
	pdflatex cs-ug-hbk.tex

index:
	pandoc -V "pagetitle:handbook.cs.virginia.edu" -f markdown -c markdown.css -t html -o index.html index.md

# requires tex4ht package
html:
	/bin/rm -rf html
	mkdir html
	htlatex cs-ug-hbk.tex "" "" -dhtml/
	cp -f html/cs-ug-hbk.html html/index.html
	/bin/rm -f cs-ug-hbk*.html
	/bin/rm -f cs-ug-hbk.4ct cs-ug-hbk.4tc cs-ug-hbk.css cs-ug-hbk.dvi \
		cs-ug-hbk.idv cs-ug-hbk.lg cs-ug-hbk.tmp cs-ug-hbk.xref

clean:
	-/bin/rm *.aux *.log *.out *.toc *~
	-/bin/rm -f cs-ug-hbk.4ct cs-ug-hbk.4tc cs-ug-hbk.css cs-ug-hbk.dvi \
		cs-ug-hbk.idv cs-ug-hbk.lg cs-ug-hbk.tmp cs-ug-hbk.xref

booklet:
	./make-booklet cs-ug-hbk.pdf

flowcharts:	/dev/null
	pdftoppm -r 600 diagrams/bs-cs.pdf | pnmtopng > diagrams/bs-cs.png
	pngtopnm diagrams/bs-cs.png | pnmfile
	pdftoppm -r 600 diagrams/ba-cs.pdf | pnmtopng > diagrams/ba-cs.png
	pngtopnm diagrams/ba-cs.png | pnmfile
	pdftoppm -r 600 diagrams/bs-cpe.pdf | pnmtopng > diagrams/bs-cpe.png
	pngtopnm diagrams/bs-cpe.png | pnmfile

latex2html:
	/bin/rm -rf cs-ug-hbk
	mkdir cs-ug-hbk
	latex2html -split 3 -long_titles 4 -rootdir html -no_navigation cs-ug-hbk.tex
