FROM ubuntu:18.04 as build
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /build

# Install prerequisites
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
  && apt-get install -y curl gcc git libc6-dev make pkg-config unzip wget dos2unix gettext

# Build ktx
RUN git clone https://github.com/deurk/qwfwd.git && cd qwfwd \
  && ./configure && make
# -> /build/qwfwd/qwfwd.bin

FROM build as install
WORKDIR /qwfwd
COPY --from=build /build/qwfwd/qwfwd.bin ./qwfwd.bin
COPY qwfwd.cfg.template ./
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
