.PHONY: test
test: clean all

.PHONY: all
all: presentation.pdf left-to-right.pdf

presentation.pdf: diagram.pdf
presentation.pdf: prompt.gif

%.pdf: %.md
	pandoc --fail-if-warnings -t beamer $< -o $@

left-to-right.pdf: left-to-right.md
	pandoc --fail-if-warnings --pdf-engine=xelatex $< -o $@

%.pdf: %.dot
	dot $< -Tpdf > $@

%.gif: %.tty
	ttyrec2gif -in $< -out $@

.PHONY: clean
clean:
	- rm *.pdf *.gif
