#!/bin/bash
#
# Asks the user for a locale to use
# Defaults to en_US
# Outputs selected locale to /tmp/locale

source utils.sh

dialog_entries=$(interleave $(ls /usr/share/i18n/locales | xargs))

dialog --default-item "en_US" --menu "Pick a locale (default: en_US)" 0 0 0 ${dialog_entries[*]} 2> /tmp/locale

fill_file_if_empty /tmp/locale "en_US"
