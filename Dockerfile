FROM amazonlinux:latest
MAINTAINER Jasper Van der Jeugt <jasper@fugue.co>
ARG STACK_RESOLVER

## Install stack.
RUN yum install -y curl gcc gmp-devel make tar gzip xz zlib-devel zip
RUN curl -sSL https://get.haskellstack.org/ | sh

## Share a stack root among users.
ENV STACK_ROOT="/var/lib/stack"
RUN mkdir "$STACK_ROOT"

## Start build
COPY preinstall-haskell-packages /usr/local/bin/preinstall-haskell-packages
RUN preinstall-haskell-packages

## Make writable for other users.
RUN chmod -R a+rw "$STACK_ROOT"
