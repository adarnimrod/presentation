.PHONY: all clean

all: presentation.pdf

presentation.pdf: diagram.pdf

%.pdf: %.md
	pandoc -t beamer $< -o $@

%.pdf: %.dot
	dot $< -Tpdf > $@

clean:
	- rm *.pdf
