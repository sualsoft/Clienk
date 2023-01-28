#!/bin/bash

# This script generates the Clienk website for hosting it in mainland China
# We swap the config files which will make zh as the main language, we generate the static files with hugo (should be installed and in path.
# The output is stored to /tmp and zipped
# The zip file should be extracted on the host that serves clienk.cn

# Here we go:

#clean up if needed
rm -rf /tmp/clienk.cn
rm /tmp/clienksitecn.zip
#compile site in /tmp and use cn config
hugo -b https://clienk.cn -d /tmp/clienk.cn --config hugo-zh.toml
#let's go into the directory to zip it
cd /tmp/clienk.cn
zip -rmD /tmp/clienksitecn .
#go back to the last directory
cd -
#cleanup the generated site
rm -rf /tmp/clienk.cn