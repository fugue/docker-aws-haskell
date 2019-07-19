FROM amazonlinux:latest
MAINTAINER Jasper Van der Jeugt <jasper@fugue.co>

## Install stack.
RUN yum install -y curl gcc gmp-devel make tar gzip xz zlib-devel zip
RUN curl -sSL https://get.haskellstack.org/ | sh

## Share a stack root among users.
RUN mkdir /var/stack
RUN chmod 777 /var/stack
ENV STACK_ROOT="/var/stack"

## Start build?
RUN stack install --resolver lts-13.0 containers
