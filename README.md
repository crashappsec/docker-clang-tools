# clang-tools (tidy+format)

This is a docker image with static builds of

- [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
- [clang-format](https://clang.llvm.org/docs/ClangFormat.html)

The packages are installed via `apt` and are make static via
[staticx](https://pypi.org/project/staticx/).
Docker image is published for both:

- `linux/amd64`
- `linux/arm64`

As everything is installed via `apt`, its easy to match the `clang-*`
versions to actual `clang` compiler.

Alternatively these tools can be installed via Python wheels from PyPI:

- [clang-tidy](https://pypi.org/project/clang-tidy/)
- [clang-format](https://pypi.org/project/clang-format/)

The reason this approach is not used here is because wheels
are not available for all versions for all architectures.

As `clang-format` wheel `>=16` supports ARM wheels,
once https://github.com/ssciwr/clang-tidy-wheel/issues/2 is resolved,
the approach can be reconsidered.
