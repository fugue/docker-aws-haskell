FROM amazonlinux:latest
MAINTAINER Jasper Van der Jeugt <jasper@fugue.co>
ARG STACK_RESOLVER

## Install stack dependencies and stack.
RUN yum install -y \
    curl \
    gcc \
    git \
    gmp-devel \
    gzip \
    make \
    ncurses-compat-libs \
    ncurses-devel \
    ssh \
    tar \
    xz \
    zip \
    zlib-devel; \
    curl -sSL https://get.haskellstack.org/ | sh

## Share a stack root among users.
ENV STACK_ROOT="/var/lib/stack"

## Start build.  This takes a while.  We also make writable for other users,
## since don't know what user will do an actual build.
COPY preinstalled-haskell-packages.txt /etc/
RUN mkdir "$STACK_ROOT"; \
    xargs stack --allow-different-user --resolver "$STACK_RESOLVER" install \
        </etc/preinstalled-haskell-packages.txt; \
    chmod -R a+rw "$STACK_ROOT"
