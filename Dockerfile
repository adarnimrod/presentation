FROM docker.io/golang:1.17-bullseye as golang
RUN go install github.com/spelufo/on-change@latest && \
    go install github.com/sugyan/ttyrec2gif@latest

# hadolint ignore=DL3007
FROM registry.shore.co.il/toolbx:latest
COPY --from=golang /go/bin/on-change /go/bin/ttyrec2gif /usr/local/bin/
# hadolint ignore=DL3008,DL3013
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        fonts-font-awesome \
        fonts-linex \
        fonts-noto-extra \
        fonts-sil-ezra \
        ghostscript \
        graphicsmagick \
        graphviz \
        groff \
        librsvg2-bin \
        lmodern \
        mandoc \
        pandoc \
        poppler-utils \
        python3-pip \
        texlive-extra-utils \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-font-utils \
        texlive-lang-arabic \
        texlive-lang-other \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-luatex \
        texlive-publishers \
        texlive-xetex \
        qpdf \
    && \
    python3 -m pip install --no-cache-dir --break-system-packages \
        diagrams \
    && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/* ~/.cache/*
ENTRYPOINT [ "/usr/local/sbin/runas" ]
CMD [ "on-change", ".", "make" ]
VOLUME /volume
WORKDIR /volume
ENV HOME /volume
# Run a test build.
COPY example/ /example/
RUN make --debug=j --keep-going -C /example all
