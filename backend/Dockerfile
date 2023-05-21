FROM golang:1-bullseye AS builder
WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download -x

COPY . ./
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-X 'github.com/wakamenod/suito/env.CommitHash=`git rev-parse --short=8 HEAD`'" -o /bin/suito

FROM gcr.io/distroless/base-debian11
# FROM alpine:3.4
WORKDIR /app

COPY --from=builder /bin/suito ./
COPY --from=builder ./src/config/ ./config/

CMD ["./suito", "run", "--config", "./config/config.debug.toml"]
