FROM alpine:3.16

RUN apk add rclone bash && rm -rf /var/cache/apk/*

WORKDIR /freewrite-sync
ADD sync.sh .

VOLUME ["/config"]
VOLUME ["/txt"]

# This will make Rclone look for its config file at /config/rclone/rclone.conf
ENV XDG_CONFIG_HOME=/config

ENTRYPOINT ["/freewrite-sync/sync.sh"]
