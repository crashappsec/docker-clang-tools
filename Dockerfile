ARG UBUNTU_VERSION=lunar-20230731

FROM ubuntu:$UBUNTU_VERSION as build

RUN apt-get update

ARG CLANG_VERSION=16
ENV PATH=/root/.local/bin:$PATH

# install clang-* tools
RUN apt-get install -y \
    clang-tidy-$CLANG_VERSION \
    clang-format-$CLANG_VERSION

# for installing staticx in isolated venv
RUN apt-get install -y pipx

# install staticx system deps
RUN apt-get install -y \
    gcc \
    patchelf \
    scons

# staticx will convert clang-* to static binaries
# for easier distribution
# this is much simpler than installing clang-* from source
# as that requires a lot of dependencies
RUN pipx install staticx

RUN staticx $(which clang-tidy-$CLANG_VERSION) /clang-tidy
RUN staticx $(which clang-format-$CLANG_VERSION) /clang-format

# ----------------------------------------------------------------------------

FROM busybox

COPY --from=build /clang-tidy /bin/clang-tidy
COPY --from=build /clang-format /bin/clang-format
