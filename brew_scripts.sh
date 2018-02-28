#!/bin/sh
#
#  _                     _         _        _ _ 
# | |__ _ _ _____ __ __ (_)_ _  __| |_ __ _| | |
# | '_ \ '_/ -_) V  V / | | ' \(_-<  _/ _` | | |
# |_.__/_| \___|\_/\_/  |_|_||_/__/\__\__,_|_|_|
#
# Start here: https://brew.sh/
#

# Better git diff (suggest to use from an alias "gd" or something):
brew install diff-so-fancy
brew install colordiff

# Favourite shell, mostly for personal scripts:
brew install fish

# Open JDK for Java 8 on Mac:
# https://stackoverflow.com/questions/24342886/how-to-install-java-8-on-mac
brew tap caskroom/versions
brew cask install java8

