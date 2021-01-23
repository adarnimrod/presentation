# Presentation

[![pipeline status](https://git.shore.co.il/nimrod/presentation/badges/master/pipeline.svg)](https://git.shore.co.il/nimrod/presentation/-/commits/master)

A Dockerized presentation toolkit for building presentation from markup (like
Markdown or DOT).

## Usage

`docker run --rm -itv “$PWD:/volume“ registry.shore.co.il/presentation`

Will watch the current directory and run `make` whenever a file changes. One can
add a shell alias
`alias presentation='docker run --rm -itv “$PWD:/volume“ registry.shore.co.il/presentation'` for easier use.

See the example folder for more details.

## Contains

- [Pandoc](http://pandoc.org/)
- [Graphviz](www.graphviz.org/)
- [GNU Make](https://www.gnu.org/software/make/)
- [LuaTex](http://luatex.org/)
- [LaTeX](http://www.latex-project.org/)
- [XeTex](http://xetex.sourceforge.net/)
- [on-change](https://github.com/spelufo/on-change)
- [groff](https://www.gnu.org/software/groff/)
- [ttyrec2gif](https://github.com/sugyan/ttyrec2gif)
- [qpdf](http://qpdf.sourceforge.net/)
- [Ghostscript](https://www.ghostscript.com/)
- [GraphicsMagick](http://www.graphicsmagick.org/)

## License

This software is licensed under the MIT license (see `LICENSE.txt`).

## Author Information

Nimrod Adar, [contact me](mailto:nimrod@shore.co.il) or visit my
[website](https://www.shore.co.il/). Patches are welcome via
[`git send-email`](http://git-scm.com/book/en/v2/Git-Commands-Email). The repository
is located at: <https://git.shore.co.il/explore/>.
