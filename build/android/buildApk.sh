#!/bin/bash
sudo set -x
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

# install os-level depends

pip install buildozer
pip install cython

sudo apt-get update; sudo apt-get -y install python3.7 python3-pip python3-setuptools wget rsync fuse
sudo apt-get install -y build-essential git python3-dev ffmpeg libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libportmidi-dev libswscale-dev libavformat-dev libavcodec-dev zlib1g-dev
sudo apt-get install aidl


sudo apt-get install -y libgstreamer1.0  gstreamer1.0-plugins-base gstreamer1.0-plugins-good
sudo apt-get install build-essential libsqlite3-dev sqlite3 bzip2 libbz2-dev zlib1g-dev libssl-dev openssl libgdbm-dev libgdbm-compat-dev liblzma-dev libreadline-dev libncursesw5-dev libffi-dev uuid-dev libffi6
sudo apt-get install libffi-dev



uname -a
cat /etc/issue
which python
which python3.7

# setup a virtualenv to isolate our app's python depends
#${PYTHON_PATH} -m pip install --upgrade --user pip setuptools
#${PYTHON_PATH} -m pip install --upgrade --user virtualenv
#${PYTHON_PATH} -m virtualenv /tmp/kivy_venv

# install kivy and all other python dependencies with pip into our virtual env
# we'll later add these to our AppDir for building the AppImage
#source /tmp/kivy_venv/bin/activate; python -m pip install -r requirements.txt

##################
# PREPARE APPDIR #
##################

# cleanup old appdir, if exists


#! /bin/bash
mkdir /home/runner/.buildozer/android/platform/android-sdk/
Cwd /home/runner/.buildozer/android/platform/
wget -P /home/runner/.buildozer/android/platform/android-sdk/ https://dl.google.com/android/repository/commandlinetools-linux-6514223_latest.zip 
unzip -q /home/runner/.buildozer/android/platform/android-sdk/commandlinetools-linux-6514223_latest.zip
Cwd /home/runner/.buildozer/android/platform/android-sdk
/home/runner/.buildozer/android/platform/android-sdk/tools/bin/sdkmanager --sdk_root=/home/runner/.buildozer/android/platform/android-sdk "build-tools;31.0.0"

# Export APPRUN if running from an extracted image
cd src
buildozer init y
#buildozer android debug yes




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
