.PHONY: all clean

all: presentation.pdf

presentation.pdf: diagram.pdf
	pandoc -t beamer presentation.md -o presentation.pdf

diagram.pdf: diagram.dot
	dot diagram.dot -Tpdf > diagram.pdf

clean:
	- rm *.pdf
