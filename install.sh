#!/bin/bash
# encoding:utf-8
#
# Copyright 2018 Yoshihiro Tanaka
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# Author: Yoshihiro Tanaka <contact@cordea.jp>
# date  : 2018-12-02

command -v brew > /dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git zsh python findutils fzf
chsh -s $(command -v zsh)

base_dir="$HOME/Documents/git-cloning/"
installer_dir="/tmp/dotfiles.installer"

git clone https://github.com/CORDEA/dotfiles.installer.git $installer_dir
find "$installer_dir/internal" -type f -exec sh {} $base_dir \;
rm -rf $installer_dir

cd $base_dir
git clone https://github.com/CORDEA/dotfiles.git
find "$(pwd)/dotfiles/src" -type f -exec ln -sf {} "$HOME/" \;

cd $base_dir
git clone git@github.com:CORDEA/dotfiles.internal.git
find "$(pwd)/dotfiles.internal/src" -d 1 -exec ln -sf {} "$HOME/" \;
