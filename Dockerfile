FROM ubuntu:18.04 as build
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /build

# Install prerequisites
RUN apt-get update && apt-get install -y gcc git libc6-dev make gettext

# Build qwfwd
RUN git clone https://github.com/deurk/qwfwd.git && cd qwfwd && ./configure && make

FROM ubuntu:18.04 as run
WORKDIR /qwfwd
COPY --from=build /build/qwfwd/qwfwd.bin ./qwfwd.bin
COPY files/qwfwd.cfg.template ./
COPY scripts/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
