FROM ubuntu:21.04

LABEL maintainer "Andreas Fertig"

ENV CLANG_VERSION=14
ENV GCC_VERSION=11
ENV UBUNTU_NAME=hirsute

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&                                                                                              \
    apt-get install -y --no-install-recommends ca-certificates gnupg wget &&                                       \
#    echo "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/${UBUNTU_NAME} ${UBUNTU_NAME} main" >> /etc/apt/sources.list &&     \
#    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1E9377A2BA9EF27F &&                                   \
    echo "deb http://apt.llvm.org/${UBUNTU_NAME}/ llvm-toolchain-${UBUNTU_NAME}-${CLANG_VERSION} main" >> /etc/apt/sources.list && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - &&                                        \
    apt-get update && apt-get install -y --no-install-recommends libstdc++-${GCC_VERSION}-dev libc++-${CLANG_VERSION}-dev libclang-${CLANG_VERSION}-dev &&  \
    apt-get remove --purge --auto-remove -y --force-yes wget dirmngr &&                                            \
    apt-get clean &&                                                                                               \
    rm -rf /var/lib/apt/lists/* &&                                                                                 \
    useradd insights &&                                                                                            \
    mkdir /home/insights &&                                                                                        \ 
    chown -R insights:insights /home/insights
