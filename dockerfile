FROM rust as build

RUN git clone https://github.com/xforce/neox-tools /neox-tools
RUN cd /neox-tools && cargo build --release

RUN git clone https://github.com/xforce/eve-echoes-tools /eve-echoes-tools
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install parso

FROM build

COPY ./run.sh /run.sh
CMD ["/bin/bash", "/run.sh"]