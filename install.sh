#!/bin/ksh
# Copyright (c) 2024 LawPaul (https://github.com/LawPaul)
# This file is part of PCM5_CarPlay_Fullscreen, licensed under CC BY-NC-SA 4.0.
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# See the LICENSE file in the project root for full license text.
# NOT FOR COMMERCIAL USE
# Original Author: lprot (https://github.com/lprot) (https://www.drive2.ru/users/lprot/)

[[ ! -e "/mnt/app" ]] && mount -t qnx6 /dev/mnanda0t177.1 /mnt/app
echo "Mounting /mnt/app in r/w mode..."
mount -uw /mnt/app
if [[ -e "/mnt/app/eso/hmi/lsd/jars" ]]; then
    if [[ -f "$modPath/fc.jar" ]]; then
        echo "Modding fullscreen CarPlay for PCM5..."
        cp -Vf $modPath/fc.jar /mnt/app/eso/hmi/lsd/jars/
    else
        echo "error: cannot find $modPath/fc.jar"
    fi
else
    echo "error /mnt/app/eso/hmi/lsd/jars does not exist"
fi
sync
[[ -e "/mnt/app" ]] && umount -f /mnt/app