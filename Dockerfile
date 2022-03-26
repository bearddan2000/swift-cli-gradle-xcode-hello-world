FROM gradle:jdk11

ENV SWIFT_PLATFORM=ubuntu18.04
ENV SWIFT_SIGNING_KEY=A62AE125BBBFBB96A6E042EC925CC1CCED3D1561
ENV SWIFT_WEBROOT=https://download.swift.org
ENV SWIFT_BRANCH=swift-5.6-release
ENV SWIFT_VERSION=swift-5.6-RELEASE

WORKDIR /app

COPY --from=swift:latest /usr/bin /usr/bin

ADD --chown=gradle:gradle bin .

ENTRYPOINT ["gradle"]

CMD ["clean", "build", "assemble", "xcode"]
