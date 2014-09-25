#!/bin/sh
#
# nanono - Nano notifications for Linux.
#
# https://github.com/macie/nanono
#
# Copyright (c) 2014 Maciej Żok <maciek.zok@gmail.com>
# MIT License (http://opensource.org/licenses/MIT)


#
#   DEFAULTS
#

readonly _nanono_ver='0.1.0'


#
#   MESSAGES
#

help_message() {
  #
  # Shows help message.
  #
  # Returns:
  #     String message to standard output.
  #
  echo 'nanono - Nano notifications for Linux.'
  echo 'Usage:'
  echo '  nanono.sh [options]'
  echo 
  echo 'Options:'
  echo '  -h, --help              Show this help and exit.'
  echo '  -V, --version           Show version number and exit.'
  echo '  -p, --packages          Show number of updated packages.'

}

version_message() {
  #
  # Shows version message.
  #
  # Returns:
  #     String message to standard output.
  #
  echo "nanono ${_nanono_ver}"
  echo
  echo 'Copyright (c) 2014 Maciej Żok'
  echo 'MIT License (http://opensource.org/licenses/MIT)'
}

default_message() {
  #
  # Shows percent message.
  #
  # Returns:
  #     String message to standard output.
  #
  get_packages
  packages=$?
  printf " -> %s packages need to be updated\n" ${packages}

}


#
#   FUNCTIONS
#

get_packages() {
  #
  # Get number of updated packages.
  #
  # Returns:
  #     An integer with number of updated packages.
  #
  packages=$( checkupdates | wc -l )
  return ${packages}
}

parse_args() {
  #
  # Parses script parameters.
  #
  # Arguments:
  #     params (str) - Script params.
  #
  # Returns:
  #     String message or nothing.
  #
  arg_num=$#
  if [ ${arg_num} -eq 0 ]; then
    default_message 
    exit 0

  else
    for arg in "$@"; do
      case "${arg}" in
        -h|--help)
          help_message
          exit 0
        ;;

        -V|--version)
          version_message
          exit 0
        ;;

        -p|--packages)
          get_packages
          echo "$?"
        ;;

        -*)
          echo "nanono: invalid option '$1'" 1>&2
          echo "Try '-h' or '--help' for more information." 1>&2
          exit 64  # command line usage error (via /usr/include/sysexits.h)
        ;;
      esac

      arg_num=$(( ${arg_num} - 1 ))
    done
  fi
}


#
#   MAIN ROUTINE
#

main () {
  parse_args "$@"

  exit 0
}

main "$@"
