FROM golang:1.11-alpine3.8 as on-change
RUN apk --update add git && \
    rm -rf /var/cache/apk/* && \
    /usr/local/go/bin/go get github.com/spelufo/on-change

FROM alpine:3.8 as pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.3/pandoc-2.3-linux.tar.gz | tar -xz
    
FROM alpine:3.8
COPY --from=on-change /go/bin/on-change /usr/local/bin
COPY --from=pandoc /pandoc-2.3/bin/* /usr/local/bin/
RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --update --no-cache \
        font-bakoma-ttf \
        gosu \
        graphviz \
        groff \
        make \
        texlive-luatex \
        texlive-xetex \
        ttf-font-awesome \
    && \
    rm -rf /tmp/* /var/tmp/*
ADD [ "https://www.shore.co.il/blog/static/runas", "/entrypoint" ]
ENTRYPOINT [ "/bin/sh", "/entrypoint" ]
CMD [ "on-change", ".", "make" ]
VOLUME /volume
WORKDIR /volume
ENV HOME /volume
# Run a test build.
COPY example/ /example/
RUN make -C /example all clean
