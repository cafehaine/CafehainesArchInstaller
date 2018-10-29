#!/bin/bash
source utils.sh

# 1- Pick console keymap
console_keymaps=($(interleave $(localectl list-keymaps)))
dialog --default-item "us" --menu "Pick a keyboard layout for console mode (default: us)" 0 0 0 ${console_keymaps[@]} 2> /tmp/console-keymap
fill_file_if_empty /tmp/console-keymap "us"

loadkeys $(cat /tmp/console-keymap)

# 2- Pick xorg keymap

# 2.A Pick layout
x11_layouts=($(interleave $(localectl list-x11-keymap-layouts)))
dialog --default-item "us" --menu "Pick a keyboard layout for graphical mode (default: us)" 0 0 0 ${x11_layouts[*]} 2> /tmp/x11-layout
fill_file_if_empty /tmp/x11-layout "us"
x11_layout=$(cat /tmp/x11-layout)

# 2.B Pick variant
x11_variants=($(interleave $(localectl list-x11-keymap-variants $x11_layout)))
dialog --menu "Pick a variant for layout $x11_layout (default: ${x11_variants[0]})" 0 0 0 ${x11_variants[*]} 2> /tmp/x11-variant
fill_file_if_empty /tmp/x11-variant ${x11_variants[0]}

# 2.C Pick model
x11_models=($(interleave $(localectl list-x11-keymap-models)))
dialog --default-item "pc105" --menu "Pick a keyboard model (default: pc105)" 0 0 0 ${x11_models[*]} 2> /tmp/x11-models
fill_file_if_empty /tmp/x11-models "pc105"

# 2.D Pick option(s?)
#4- (optional) localectl list-x11-keymap-options
