# Presentation

[![pipeline status](https://git.shore.co.il/nimrod/presentation/badges/master/pipeline.svg)](https://git.shore.co.il/nimrod/presentation/-/commits/master)

A containerized presentation toolkit for building presentations from markup
(like Markdown or DOT).

## Usage

`podman run --rm -itv “$PWD:/volume“ registry.shore.co.il/presentation`

Will watch the current directory and run `make` whenever a file changes
(replace `podman` with `docker` if that's what you're using).

See the example folder for more details and the [generated
PDF](https://git.shore.co.il/nimrod/presentation/-/jobs/artifacts/master/raw/example/presentation.pdf?job=presentation%20build).

If you're using GitLab, check out the [CI
template](https://git.shore.co.il/nimrod/presentation/-/blob/master/gitlab-ci-template/presentation.yml)
if you wish to build presentation as part of a pipeline.

Yet another option is using the contained tools instead of installing them in
your system. For that copy the [presentation
script](https://git.shore.co.il/nimrod/presentation/-/blob/master/presentation)
to some in your `PATH` and create symlinks to the script with the name of the
binary you wish to use. For example:

```
curl https://git.shore.co.il/nimrod/presentation/-/blob/master/presentation > ~/.local/bin/presentation
chmod +x ~/.local/bin/presentation
ln -s ~/.local/bin/pandoc presentation
```

In this example when you run `pandoc` it would run it using podman.

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
- [Poppler utils](https://poppler.freedesktop.org/)
- [Diagrams](https://diagrams.mingrammer.com/)

## License

This software is licensed under the MIT license (see `LICENSE.txt`).

## Author Information

Nimrod Adar, [contact me](mailto:nimrod@shore.co.il) or visit my
[website](https://www.shore.co.il/). Patches are welcome via
[`git send-email`](http://git-scm.com/book/en/v2/Git-Commands-Email). The repository
is located at: <https://git.shore.co.il/explore/>.
