#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Set Audio
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔈

# Documentation:
# @raycast.author Queensferry
# @raycast.authorURL https://github.com/queensferryme

/usr/local/bin/hda-verb 0x19 SET_PIN_WIDGET_CONTROL 0x25
/usr/local/bin/hda-verb 0x21 SET_UNSOLICITED_ENABLE 0x83
