# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool manifest ci/manifest.yml
#
# https://gitlab.com/libvirt/libvirt-ci

FROM registry.opensuse.org/opensuse/tumbleweed:latest

RUN zypper update -y && \
    zypper install -y \
           ca-certificates \
           ccache \
           dbus-1 \
           gcc \
           git \
           glib2-devel \
           glibc-locale \
           libvirt-devel \
           libvirt-glib-devel \
           make \
           meson \
           ninja \
           pkgconfig \
           python3-base \
           python3-dbus-python \
           python3-docutils \
           python3-flake8 \
           python3-gobject \
           python3-pytest \
           rpm-build && \
    zypper clean --all && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
