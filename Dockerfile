FROM python:3.10-slim

ARG CLANG_TIDY_VERSION

RUN apt-get update && \
    apt-get install -y \
        clang \
        && \
    pip install \
        clang-tidy==$CLANG_TIDY_VERSION \
        && \
    apt-get purge -y \
        clang \
        && \
    apt-get autoremove -y && \
    apt-get clean
