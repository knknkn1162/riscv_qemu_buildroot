FROM knknkn1162/riscv_toolchain_qemu
ARG VERSION=2019.11.1
ARG MAIN_DIR=/home/main
WORKDIR ${MAIN_DIR}

RUN apt-get update && \
  apt-get install -y binutils build-essential gcc g++ patch perl cpio unzip rsync bc wget python libncurses5-dev curl

RUN curl -fsSL https://buildroot.org/downloads/buildroot-${VERSION}.tar.gz | tar xfz -

WORKDIR ${MAIN_DIR}/buildroot-${VERSION}

RUN make qemu_riscv64_virt_defconfig && \
  make
