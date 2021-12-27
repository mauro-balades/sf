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

# Define colors using ANSI color codes
RESET="\e[0m"
BGREEN="\e[1;32m"
BMAGENTA="\e[1;35m"
BCYAN="\e[1;36m"
BBLUE="\e[1;34m"
BRED="\e[1;31m"
BGRAY="\e[1;30m"

# Default values
CCOLOR="\e[0;36m" # -c | --color     : Default color for information text (defaults to cyan)
TEXT="false"      # -t | --text      : Show text instead of icons         (defaults to false)
OS="auto"         # -o | --OS        : OS to display in the screen        (defaults to auto)
UPPER_TEXT="true" # -u | --uper-text : print upper text if text is true   (defaults to true)

# Parse command line arguments
POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -c|--color)
      CCOLOR="$2"
      shift # past argument
      shift # past value
      ;;
    -t|--text)
      TEXT="$2"
      shift # past argument
      shift # past value
      ;;
    -u|--uper-text)
      UPPER_TEXT="$2"
      shift # past argument
      shift # past value
      ;;
    -o|--OS)
      OS="$2"
      shift # past argument
      shift # past value
      ;;
    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
  esac
done

# We will start by geting the distro's
# information.

# Get current linux user.
USER=$(whoami)

# Get linux kernel version
KERNEL=$(uname -r)

# Get shell.
# we use basename to get the "shell name".
# e.g.
#   Imagine you use zsh for your shell.
#   "$SHELL" would be equal to "/bin/zsh".
#   if we get the base name, we would get
#   "zsg" as the return value
SHELL=$(basename "$SHELL")

# get OS if the argument (OS) is set to auto.

if [ "$OS" == "auto" ];
then
    # Check if /etc/os-release exists
    if [ -f /etc/os-release ]; then
        # Source os-release
        . /etc/os-release

        # Get variables
        OS=$NAME
        VER=$VERSION_ID
    elif type lsb_release > /dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
    elif [ -f /etc/SuSe-release ]; then
        # Older SuSE/etc.
        # TODO
        ...
    elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        # TODO
        ...
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        OS=$(uname -s)
        VER=$(uname -r)
    fi
fi

# next, we will continue by getting the
# distribution's icon. by default, we
# will set it as an UFO.
# Get it?
# because it is an unidentified flying object...
# ASCII arts will need to have a size of 7 rows,
# 1 space extra to the right and all rows with
# the same size.
ICON1="$BGRAY      ___      "
ICON2="$BGRAY  ___/   \\___ "
ICON3="$BGRAY /   '---'   \\"
ICON4="$BGRAY '--_______--' "
ICON5="$BGRAY      / \\     "
ICON6="$BGRAY     /   \\    "
ICON7="$BGRAY    /     \\   "
ICON8="$BGRAY               "

if [ "$OS" == "KDE neon" ]; then
    ICON1="$BGREEN              "
    ICON2="$BGREEN      --- _   "
    ICON3="$BGREEN   /  ---  \\  "
    ICON4="$BGREEN  |  |   |  | "
    ICON5="$BGREEN   \\  --- _/  "
    ICON6="$BGREEN      ---     "
    ICON7="$BGREEN              "
    ICON8="$BGREEN              "
elif [ "$OS" == "Gentoo" ]; then
    ICON1="$BMAGENTA    _-----_     "
    ICON2="$BMAGENTA   (       \\   "
    ICON3="$BMAGENTA   \\    0   \\  "
    ICON4="$BMAGENTA    \\        ) "
    ICON5="$BMAGENTA    /      _/  "
    ICON6="$BMAGENTA   (     _-     "
    ICON7="$BMAGENTA   \\____-      "
    ICON8="$BMAGENTA                "
elif [ "$OS" == "Linux Mint" ]; then
    ICON1="$BGREEN    _____________    "
    ICON2="$BGREEN   |_            \\  "
    ICON3="$BGREEN    |  | _____  |   "
    ICON4="$BGREEN    |  | | | |  |   "
    ICON5="$BGREEN    |  | | | |  |   "
    ICON6="$BGREEN    |  \\_____/  |   "
    ICON7="$BGREEN    \\___________/   "
    ICON8="$BGREEN                     "
elif [ "$OS" == "Manjaro" ]; then
    ICON1="$BGREEN  ________  __ "
    ICON2="$BGREEN |       | |  |"
    ICON3="$BGREEN |   ____| |  |"
    ICON4="$BGREEN |  |  __  |  |"
    ICON5="$BGREEN |  | |  | |  |"
    ICON6="$BGREEN |  | |  | |  |"
    ICON7="$BGREEN |  | |  | |  |"
    ICON8="$BGREEN |__| |__| |__|"
elif [ "$OS" == "openSUSE Leap" ]; then
    ICON1="$BGREEN   _______    "
    ICON2="$BGREEN __|   __ \\  "
    ICON3="$BGREEN      / .\\ \\ "
    ICON4="$BGREEN      \\__/ | "
    ICON5="$BGREEN    _______| "
    ICON6="$BGREEN    \\_______ "
    ICON7="$BGREEN __________/  "
    ICON8="$BGREEN              "
elif [ "$OS" == "NixOS" ]; then
    ICON1="$BMAGENTA                     "
    ICON2="$BMAGENTA   \\\\  \\\\ //     "
    ICON3="$BMAGENTA  ==\\\\__\\\\/ //   "
    ICON4="$BMAGENTA    //   \\\\//   "
    ICON5="$BMAGENTA ==//     //== "
    ICON6="$BMAGENTA  //\\\\___//        "
    ICON7="$BMAGENTA // /\\\\  \\\\==    "
    ICON8="$BMAGENTA   // \\\\  \\\\     "
elif [ "$OS" == "postmarketOS" ]; then
    ICON1="$BGREEN        /\\        "
    ICON2="$BGREEN       /  \\       "
    ICON3="$BGREEN      /    \\      "
    ICON4="$BGREEN     /\\__   \\     "
    ICON5="$BGREEN    /   /\\  _\\    "
    ICON6="$BGREEN   /   ___\\/  \\  "
    ICON7="$BGREEN  /    \\       \\ "
    ICON8="$BGREEN /_____/________\\ "
elif [ "$OS" == "Pop!_OS" ]; then
    ICON1="$BCYAN ______               "
    ICON2="$BCYAN \\   _ \\        __  "
    ICON3="$BCYAN  \\ \\ \\ \\      / /  "
    ICON4="$BCYAN   \\ \\_\\ \\    / /   "
    ICON5="$BCYAN    \\  ___\\  /_/    "
    ICON6="$BCYAN     \\ \\    _       "
    ICON7="$BCYAN    __\\_\\__(_)_     "
    ICON8="$BCYAN   (___________)      "
elif [ "$OS" == "Slackware" ]; then
    ICON1="$BBLUE    ________    "
    ICON2="$BBLUE   /  ______|   "
    ICON3="$BBLUE   | |______    "
    ICON4="$BBLUE   \\______  \\   "
    ICON5="$BBLUE    ______| |   "
    ICON6="$BBLUE | |________/   "
    ICON7="$BBLUE |____________  "
    ICON8="$BBLUE                "
elif [ "$OS" == "Zorin OS" ]; then
    ICON1="$BBLUE    ______    "
    ICON2="$BBLUE   /______\\  "
    ICON3="$BBLUE  /      / \\ "
    ICON4="$BBLUE /      /   \\"
    ICON5="$BBLUE \\     /    /"
    ICON6="$BBLUE  \\   /___ / "
    ICON7="$BBLUE   \\______/  "
    ICON8="$BBLUE              "
elif [ "$OS" == "Solus" ]; then
    ICON1="$BMAGENTA     __________       "
    ICON2="$BMAGENTA    /          \\   "
    ICON3="$BMAGENTA   /   /\\ \\     \\  "
    ICON4="$BMAGENTA  /   /  \\ \\     \\ "
    ICON5="$BMAGENTA |   /    \\ \\     |"
    ICON6="$BMAGENTA  \\--------------/   "
    ICON7="$BMAGENTA   \\------------/    "
    ICON8="$BMAGENTA    \\----------/     "
elif [ "$OS" == "Ubuntu" ]; then
    ICON1="$BRED "
    ICON2="$BRED          _   "
    ICON3="$BRED      ---(_)  "
    ICON4="$BRED  _/  ---  \\  "
    ICON5="$BRED (_) |   |    "
    ICON6="$BRED   \\  --- _/ "
    ICON7="$BRED      ---(_)  "
    ICON8="$BRED              "
elif [ "$OS" == "void" ]; then
    ICON1="$BGREEN       _____       "
    ICON2="$BGREEN    _  \\____ -    "
    ICON3="$BGREEN   / / ____ \\ \\   "
    ICON4="$BGREEN  / / /    \\ \\ \\  "
    ICON5="$BGREEN  | |         | | "
    ICON6="$BGREEN  \\ \\ \\____/ / /"
    ICON7="$BGREEN   \\ \\____  /_/  "
    ICON8="$BGREEN    -_____\\       "
fi

print_section() {
    ICON="$1"
    SECTION="$2"
    VALUE="$3"

    echo -e "$ICON    $SECTION $RESET$VALUE"
}

if [ "$TEXT" == "false" ];
then
    print_section "$ICON1"
    print_section "$ICON2"   ""  "$USER"
    print_section "$ICON3"   ""  "$OS"
    print_section "$ICON4"   ""  "$KERNEL"
    print_section "$ICON5"   ""  "$SHELL"
    print_section "$ICON6"
    print_section "$ICON7"
    print_section "$ICON8"
else
    if [ "$UPPER_TEXT" == "true" ];
    then
        print_section "$ICON1"
        print_section "$ICON2"   "  USER"  "$USER"
        print_section "$ICON3"   "    OS"  "$OS"
        print_section "$ICON4"   "KERNEL"  "$KERNEL"
        print_section "$ICON5"   " SHELL"  "$SHELL"
        print_section "$ICON6"
        print_section "$ICON7"
        print_section "$ICON8"
    else
        print_section "$ICON1"
        print_section "$ICON2"   "  user"  "$USER"
        print_section "$ICON3"   "    os"  "$OS"
        print_section "$ICON4"   "kernel"  "$KERNEL"
        print_section "$ICON5"   " shell"  "$SHELL"
        print_section "$ICON6"
        print_section "$ICON7"
        print_section "$ICON8"
    fi
fi