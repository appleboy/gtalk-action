# Rebuild the original release with a patched Go runtime and supported Alpine.
FROM --platform=$BUILDPLATFORM golang:1.26.7-alpine AS build
ARG TARGETOS
ARG TARGETARCH
WORKDIR /src
ADD https://api.github.com/repos/appleboy/drone-gtalk/tarball/a2ec554938a7bc3546f3f0ccf17a09996b2b7c6d /tmp/source.tar.gz
RUN echo "eaf4c480048a9f3d87b7c9f768381a63e6db0575018f076a662be855970b85db  /tmp/source.tar.gz" | sha256sum -c - \
    && tar -xzf /tmp/source.tar.gz --strip-components=1 -C /src \
    && CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -trimpath -o /bin/drone-gtalk .

FROM alpine:3.23
RUN apk add --no-cache ca-certificates
COPY --from=build /bin/drone-gtalk /bin/drone-gtalk
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
