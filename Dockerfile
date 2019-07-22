FROM amazonlinux:latest
MAINTAINER Jasper Van der Jeugt <jasper@fugue.co>
ARG STACK_RESOLVER

## Install stack.
RUN yum install -y curl gcc gmp-devel make tar gzip xz zlib-devel zip
RUN curl -sSL https://get.haskellstack.org/ | sh

## Share a stack root among users.
ENV STACK_ROOT="/var/lib/stack"
RUN mkdir "$STACK_ROOT"

## Start build.  This takes a while.
COPY preinstalled-haskell-packages.txt /etc/
RUN xargs stack --resolver "$STACK_RESOLVER" install \
        </etc/preinstalled-haskell-packages.txt

## Make writable for other users.  This may also take a while depending on your
## filesystem...
RUN chmod -R a+rw "$STACK_ROOT"
