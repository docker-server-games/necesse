ARG NECESSE_VERSION="1-0-1-20510020"

FROM debian:bookworm AS builder

RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates unzip

COPY . .
WORKDIR /app

ARG NECESSE_VERSION
ENV NECESSE_VERSION="${NECESSE_VERSION}"
RUN /app/build.sh

FROM debian:bookworm

LABEL org.opencontainers.image.source="https://github.com/docker-server-games/necesse"

COPY . .
COPY --from=builder /app /app
WORKDIR /app

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/start.sh"]