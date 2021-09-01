#!/bin/bash

################################################################################
# File:    android/buildApk.sh
# Purpose: Builds an android apk for a simple Hello World
#          GUI app using kivy. See also:
#
#          * https://kivy.org/doc/stable/installation/installation-linux.html
#          * https://kivy.org/doc/stable/guide/basic.html
#          * https://python-for-android.readthedocs.io/en/latest/quickstart/
#
# Authors: Michael Altfield <michael@buskill.in>
# Created: 2020-05-30
# Updated: 2020-05-31
# Version: 0.2
################################################################################

############
# SETTINGS #
############

PYTHON_PATH='/usr/bin/python3.7'
###################
# INSTALL DEPENDS #
###################
pwd
echo "list"
ls
echo "list end"
install os-level depends
pip install kivy
pip install kivymd
pip install buildozer
pip install cython
sudo apt-get update; sudo apt-get -y install python3.7 python3-pip python3-setuptools wget rsync fuse
sudo apt-get install -y build-essential git python3-dev ffmpeg libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libportmidi-dev libswscale-dev libavformat-dev libavcodec-dev zlib1g-dev
sudo apt-get install -y libgstreamer1.0  gstreamer1.0-plugins-base gstreamer1.0-plugins-good
sudo apt-get install build-essential libsqlite3-dev sqlite3 bzip2 libbz2-dev zlib1g-dev libssl-dev openssl libgdbm-dev libgdbm-compat-dev liblzma-dev libreadline-dev libncursesw5-dev libffi-dev uuid-dev libffi6
sudo apt-get install libffi-dev

uname -a
cat /etc/issue
which python
which python3.7

##################
# PREPARE APPDIR #
##################

# cleanup old appdir, if exists



# Export APPRUN if running from an extracted image
cd /home/runner/work/throwawayrepo/throwawayrepo/src
echo y | buildozer init 
rm buildozer.spec
mv /home/runner/work/throwawayrepo/throwawayrepo/build/android/buildozer.spec buildozer.spec
echo y | buildozer android debug 

exit "$?"
EOF

#######################
# OUTPUT VERSION INFO #
#######################

uname -a
cat /etc/issue
which python
python --version
python -m pip list

##################
# CLEANUP & EXIT #
##################

# exit cleanly
exit 0
