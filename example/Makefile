.PHONY: all clean

all: presentation.pdf left-to-right.pdf

presentation.pdf: diagram.pdf
presentation.pdf: prompt.gif

%.pdf: %.md
	pandoc -t beamer $< -o $@

left-to-right.pdf: left-to-right.md
	pandoc --pdf-engine=xelatex $< -o $@

%.pdf: %.dot
	dot $< -Tpdf > $@

%.gif: %.tty
	ttyrec2gif -in $< -out $@

clean:
	- rm *.pdf *.gif
