# Presentation

A Dockerized presentation toolkit for building presentation from markup (like
Markdown or DOT).

## Usage

`docker run -itv "$PWD:/project" adarnimrod/presentation`

Will watch the current directory and run `make` whenever a file changes. One can
add a shell alias `alias presentation='docker run -itv "$PWD:/volume"
adarnimrod/presentation'` for easier use.

See the example folder for more details.

## Contains

- [Pandoc](http://pandoc.org/)
- [Graphviz](www.graphviz.org/)
- [GNU Make](https://www.gnu.org/software/make/)
- [LuaTex](http://luatex.org/)
- [LaTeX](http://www.latex-project.org/)
- [on-change](https://github.com/spelufo/on-change)

## License

This software is licensed under the MIT license (see `LICENSE.txt`).

## Author Information

Nimrod Adar, [contact me](mailto:nimrod@shore.co.il) or visit my [website](
https://www.shore.co.il/). Patches are welcome via [`git send-email`](
http://git-scm.com/book/en/v2/Git-Commands-Email). The repository is located
at: <https://www.shore.co.il/git/>.
