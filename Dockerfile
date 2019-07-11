FROM ubuntu:18.04

LABEL maintainer "Andreas Fertig"

ENV CLANG_VERSION=8

RUN apt-get update &&                                                                               \
    apt-get install -y --no-install-recommends ca-certificates gnupg wget &&                        \
    echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-${CLANG_VERSION} main" >> /etc/apt/sources.list && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - &&                         \
    apt-get update && apt-get install -y --no-install-recommends libstdc++-7-dev libclang-${CLANG_VERSION}-dev &&  \
    apt-get remove --purge --auto-remove -y --force-yes wget dirmngr &&                             \
    apt-get clean &&                                                                                \
    rm -rf /var/lib/apt/lists/*                                                                     \
    useradd insights &&                                                                             \
    mkdir /home/insights &&                                                                         \
    chown -R insights:insights /home/insights
