
FROM rust as build
# Can be MacOS, Linux or Windows
ENV ARCH=Linux

RUN git clone https://github.com/xforce/neox-tools /neox-tools
RUN cd /neox-tools && cargo build --release

RUN git clone --recursive https://github.com/xforce/eve-echoes-tools /eve-echoes-tools
RUN cd /eve-echoes-tools && cargo build --release

RUN git clone https://github.com/Leandros/fbxconvert.git /fbxconvert
RUN chmod +x /fbxconvert/${ARCH}/PVRTexTool/PVRTexToolCLI

RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  imagemagick \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install parso mmh3

COPY ./run.sh /run.sh
CMD ["/bin/bash", "/run.sh"]