FROM python:2-slim-buster

# configure apt-get
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt-get -yqq update \
    && apt-get -yqq dist-upgrade \
    && apt-get -yqq install \
        build-essential python-dev dnsmasq \
        git procps libnl-genl-3-dev libnl-3-dev \
    && apt-get clean
RUN git clone https://github.com/wifiphisher/wifiphisher.git \
    && cd wifiphisher \
    && python setup.py install

CMD ["wifiphisher"]
