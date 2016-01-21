FROM alpine:latest

COPY build-node.sh /tmp/
COPY entry.sh /entry.sh

RUN chmod +x /tmp/build-node.sh /entry.sh && /tmp/build-node.sh

ENTRYPOINT ["/entry.sh"]
