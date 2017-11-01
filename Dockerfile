FROM golang:1.9-alpine as on-change
RUN apk --update add git && \
    rm -rf /var/cache/apk/* && \
    /usr/local/go/bin/go get github.com/spelufo/on-change

FROM debian:stretch-slim
COPY --from=on-change /go/bin/on-change /usr/local/bin
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        graphviz \
        lmodern \
        make \
        pandoc \
        sudo \
        texlive-extra-utils \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-font-utils \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-luatex \
        texlive-publishers && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/*
VOLUME /project
WORKDIR /project
COPY entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD ["on-change", ".", "make"]
