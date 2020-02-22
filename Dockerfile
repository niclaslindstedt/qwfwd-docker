FROM ubuntu:18.04 as build
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /build
RUN apt-get update && apt-get install -y gcc git libc6-dev make gettext
RUN git clone https://github.com/deurk/qwfwd.git && cd qwfwd && ./configure && make

FROM ubuntu:18.04 as run
WORKDIR /qwfwd
RUN apt-get update && apt-get install -y gettext \
  && rm -rf /var/lib/apt/lists/*
COPY files .
COPY --from=build /build/qwfwd/qwfwd.bin ./qwfwd.bin
COPY scripts/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
