.PHONY: all clean

all: presentation.pdf

presentation.pdf: diagram.pdf
presentation.pdf: prompt.gif

%.pdf: %.md
	pandoc -t beamer $< -o $@

%.pdf: %.dot
	dot $< -Tpdf > $@

%.gif: %.tty
	ttyrec2gif -in $< -out $@

clean:
	- rm *.pdf *.gif
