#!/bin/bash

# This script generates the Clienk website for hosting it in mainland China
# We use the config file which will make zh as the main language, we generate the static files with hugo (should be installed and in path.

# The output is stored to /tmp and zipped
# The zip file should be extracted on the host that serves clienk.cn

# Here we go:

# Clean up if needed
rm -rf /tmp/clienk.cn /tmp/clienksitecn.zip

# Compile site in /tmp and use cn config
hugo -b https://clienk.cn -d /tmp/clienk.cn --config hugo-zh.toml

# Let's go into the directory to zip it
(cd /tmp/clienk.cn && zip -rmD /tmp/clienksitecn . && cd -)

# Clean up the generated site directory
rm -rf /tmp/clienk.cn

# Copy the file to website /tmp folder
scp /tmp/clienksitecn.zip root@clienk.cn:/tmp/.
