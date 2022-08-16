# clang-tidy

This is a docker image which pre-installs
[`clang-tidy`](https://pypi.org/project/clang-tidy/) PyPI package. Currently
the package does not have a pre-compiled wheel for ARM which makes installing
it very slow on ARM as it needs to compile all of LLVM. This docker image
allows to cache that as it ships with pre-compiled container for both
`linux/amd64` and `linux/arm64`.

Once https://github.com/ssciwr/clang-tidy-wheel/issues/2 is resolved, this
image will be obsolete and native `pip install clang-tidy` on ARM will no
longer require recompilation
