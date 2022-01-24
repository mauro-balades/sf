#!/bin/bash

: ' MIT License
|--------------------------------------------------------------------------
| Copyright (c) 2021 Mauro Baladés
|--------------------------------------------------------------------------
|
| Permission is hereby granted, free of charge, to any person obtaining a copy
| of this software and associated documentation files (the "Software"), to deal
| in the Software without restriction, including without limitation the rights
| to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
| copies of the Software, and to permit persons to whom the Software is
| furnished to do so, subject to the following conditions:
|
| The above copyright notice and this permission notice shall be included in all
| copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
| IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
| FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
| AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
| LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
| OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
| SOFTWARE.
|
'

# =============== COLORS ===============
#
# This are the colors configuration. sf
# uses a variety of colors, this are the
# only one that you can use. If you whant
# (for e.g) to change BBLUE to green, you
# can define it as follows:
#   => BBLUE="$BGREEN" # or another color
#
# note:
#   * It is not recomended if you edit
#     this configuration colors if you
#     don't know 100% what you are doing.
#
#   * It is better to not edit this colors
#     except for `CCOLOR`
#
#   * This colors are supposed to be bold
#     by default (you can change that)
#

# `CCOLOR` is used to replace all
# colors to `CCOLORS`'s value.
# if it is set to auto, nothing will
# change.
#
# info:
#   * default: auto
#   * accepts: auto, `ANSI color`
#
CCOLOR="auto"

# Bold green
#
# info:
#   * default: "\e[1;32m"
#   * accepts: `ANSI color`
#
BGREEN="\e[1;32m"

# Bold magenta
#
# info:
#   * default: "\e[1;33m"
#   * accepts: `ANSI color`
#
BMAGENTA="\e[1;35m"

# Bold cyan
#
# info:
#   * default: "\e[1;36m"
#   * accepts: `ANSI color`
#
BCYAN="\e[1;36m"

# Bold blue
#
# info:
#   * default: "\e[1;34m"
#   * accepts: `ANSI color`
#
BBLUE="\e[1;34m"

# Bold red
#
# info:
#   * default: "\e[1;31m"
#   * accepts: `ANSI color`
#
BRED="\e[1;31m"

# Bold gray
#
# info:
#   * default: "\e[1;30m"
#   * accepts: `ANSI color`
#
BGRAY="\e[1;30m"

# =============== TEXT ===============
#
# This is the configuration to edit the text
# and splicitly declare whether the user whant's
# to use icons or text and if text should be
# upercase or lowercase.
#
# note:
#   * Variables should contain '"' so that
#     bash declares it as a string and not
#     a as a boolean.
#
# info:
#   * default: "false"
#   * accepts: "false", "true"
#
TEXT="false"

# Declare if sf should use text instead of
# icons. This can be declared if user's
# terminal does not support this icons.
#
# info:
#   * default: "false"
#   * accepts: "false", "true"
#
UPPER_TEXT="true"


# =============== VARIABLES ===============
#
# This are a set of variables wich will be used
# for the information output used in sf.

# Define if OS should be `checked automatically`
# or to have a static name.
#
# note:
#   * This can affect the distro's logo
#
# info:
#   * default: "auto"
#   * accepts: "auto", "<ANY NAME YOU WHANT>"
#
OS="auto"

# This will be the shell's name. DO NOT
# change the SHELL variable, because
# sf will just get confused.
#
# example:
#   zsh, bash, ...
#
# info:
#   * default: "auto"
#   * accepts: "auto", "<ANY NAME YOU WHANT>"
#
SHELL_NAME="auto"

# Change your kernel's name.
#
# info:
#   * default: "auto"
#   * accepts: "auto", "<ANY NAME YOU WHANT>"
#
KERNEL="auto"

# Change your CPU information.
#
# info:
#   * default: "auto"
#   * accepts: "auto", "<ANY NAME YOU WHANT>"
#
CPU="auto"

# Define your uptime from wher you
# turned on your computer.
#
# info:
#   * default: "auto"
#   * accepts: "auto", "<ANY NAME YOU WHANT>"
#
UPTIME="auto"
