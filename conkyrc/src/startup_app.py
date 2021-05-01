#!/usr/bin/env python3
import os
import sys
home = os.environ["HOME"]

name = sys.argv[1]; command = sys.argv[2]

launcher = ["[Desktop Entry]", "Name=", "Exec=", "Type=Application", "X-GNOME-Autostart-enabled=true"]
directory = home+"/.config/autostart/"
if not os.path.exists(directory):
    os.makedirs(directory)
file = directory+name.lower()+".desktop"

if not os.path.exists(file):
    with open(file, "wt") as out:
        for launch in launcher:
            launch = launch+name if launch == "Name=" else launch
            launch = launch+command if launch == "Exec=" else launch
            out.write(launch+"\n")
else:
    print("file exists, choose another name")
    sys.exit(0)
