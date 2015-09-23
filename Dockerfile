FROM ubuntu:14.04.3

# Set noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

# apt update
RUN apt-get clean all && apt-get update && apt-get upgrade -y

# apt install
RUN apt-get install -y \
        python3 \
        git \
        libblas-dev \
        liblapack-dev \
        libatlas-base-dev \
        gfortran \
        libcurl4-openssl-dev \
        libgfortran3 \
        pkg-config \
        build-essential \
        python-setuptools \
        libssl-dev \
        python3-dev \
        python3-pip \
        libpng* \
        freetype* \
        cmake

# apt clean
RUN apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /data /config

# Create user, give sudo privileges
RUN adduser --disabled-password bio
RUN adduser bio sudo

# Install tn93 (hivtrace dependency)
RUN git clone https://github.com/veg/tn93.git && cd tn93 && cmake -DCMAKE_INSTALL_PREFIX=/usr/local/ ./ && make install

# install virtualenv
RUN pip3 install virtualenv

USER bio

# create virtualenv
WORKDIR /home/bio
RUN virtualenv env

# Install hivtrace and dependencies
RUN /home/bio/env/bin/pip3 install numpy
RUN /home/bio/env/bin/pip3 install biopython
RUN /home/bio/env/bin/pip3 install git+https://github.com/veg/hivtrace.git --process-dependency-links

# add virtualenv bin to path
ENV PATH=/home/bio/env/bin:$PATH

# Set the entry point for hivtrace
ENTRYPOINT ["hivtrace"]

CMD ["--help"]

