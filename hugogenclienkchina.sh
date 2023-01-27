#!/bin/bash

# This script generates the Clienk website for hosting it in mainland China
# We swap the config files which will make zh as the main language, we generate the static files with hugo (should be installed and in path.
# The output is stored to /tmp and zipped
# The zip file should be extracted on the host that serves clienk.cn

# Here we go:

hugo -b https://clienk.cn -d /tmp/clienk.cn --default-language zh
