Undergraduate Handbook for the Department of Computer Science at the University of Virginia
===========================================================================================

This is the LaTeX source of the UVa CS undergraduate handbook that is made available to all computing majors.  The department has three undergraduate majors (BS CS, BA CS, and BS CpE).  The source for the department's [graduate handbook](https://github.com/uva-cs/grad-handbook) is also available online.

The current version will always be available, in PDF form, online at http://handbook.cs.virginia.edu.

The primary author of this handbook is [Luther Tychonievich](http://www.cs.virginia.edu/~lat7h/).  If you have any suggestions, corrections, etc., please either [execute a pull request](https://help.github.com/articles/using-pull-requests) or contact him.

To create the PDF of the handbook:

- Ensure that the following programs are installed: make pdflatex pdftoppm pnmtopng pngtopnm, as well as a few other LaTeX extras (fonts and packages)
    - On Ubuntu 18.04, that's the following packages: `netpbm git make poppler-utils texlive-latex-base texlive-fonts-recommended texlive-latex-extra`
- Run `make` twice
