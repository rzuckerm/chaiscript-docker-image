FROM ubuntu:18.04

COPY CHAISCRIPT_* /tmp/
RUN apt-get update && \
    apt-get install -y git cmake make g++ && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/ChaiScript/ChaiScript -b v$(cat /tmp/CHAISCRIPT_VERSION) && \
    cd ChaiScript && \
    cmake . && \
    make -j4 && \
    make install && \
    cd / && \
    apt-get remove -y git cmake make && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /opt/ChaiScript
