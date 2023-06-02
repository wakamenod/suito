FROM gcr.io/distroless/base:debug

ENV ROOT /backend
WORKDIR $ROOT

# COPY . /
# CMD ["./suito", "run", "--config", "./config/config.debug.toml"]
# EXPOSE 8009

COPY run.sh run.sh

CMD ["./run.sh"]
EXPOSE 8009