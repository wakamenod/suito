FROM gcr.io/distroless/base-debian11

ENV ROOT /
WORKDIR $ROOT
COPY . /
CMD ["./suito", "run", "--config", "./config/config.debug.toml"]
EXPOSE 8009