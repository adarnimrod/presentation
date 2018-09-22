FROM golang:1.11-alpine3.8 as on-change
RUN apk --update add git && \
    rm -rf /var/cache/apk/* && \
    /usr/local/go/bin/go get github.com/spelufo/on-change

FROM debian:buster-slim
COPY --from=on-change /go/bin/on-change /usr/local/bin
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        fonts-font-awesome \
        gosu \
        graphviz \
        groff \
        lmodern \
        make \
        pandoc \
        texlive-extra-utils \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-font-utils \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-luatex \
        texlive-publishers \
        texlive-xetex \
    && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/*
ADD [ "https://www.shore.co.il/blog/static/runas", "/entrypoint" ]
ENTRYPOINT [ "/bin/sh", "/entrypoint" ]
CMD [ "on-change", ".", "make" ]
VOLUME /volume
WORKDIR /volume
ENV HOME /volume
# Run a test build.
COPY example/ /example/
RUN make -C /example all clean
