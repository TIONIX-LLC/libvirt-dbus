FROM docker.io/library/debian:10

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install --no-install-recommends -y \
            bash \
            bash-completion \
            ca-certificates \
            ccache \
            cpanminus \
            dbus \
            flake8 \
            gcc \
            gettext \
            git \
            libc6-dev \
            libglib2.0-dev \
            libvirt-dev \
            libvirt-glib-1.0-dev \
            locales \
            make \
            ninja-build \
            patch \
            perl \
            pkgconf \
            python3 \
            python3-dbus \
            python3-docutils \
            python3-gi \
            python3-pip \
            python3-pytest \
            python3-setuptools \
            python3-wheel && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
    dpkg-reconfigure locales && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

RUN pip3 install \
         meson==0.54.0

ENV LANG "en_US.UTF-8"

ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
