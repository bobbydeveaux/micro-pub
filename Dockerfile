FROM golang:1.8
COPY       micro-pub /bin/micro-pub
ENTRYPOINT ["/bin/micro-pub"]
EXPOSE 8181
