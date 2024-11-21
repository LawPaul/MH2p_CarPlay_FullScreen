#!/bin/ksh
# Copyright (c) 2024 LawPaul (https://github.com/LawPaul)
# This file is part of MH2p_CarPlay_Fullscreen, licensed under CC BY-NC-SA 4.0.
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# See the LICENSE file in the project root for full license text.
# NOT FOR COMMERCIAL USE
# Original Author: lprot (https://github.com/lprot) (https://www.drive2.ru/users/lprot/)

[[ ! -e "/mnt/app" ]] && mount -t qnx6 /dev/mnanda0t177.1 /mnt/app
echo "Mounting /mnt/app in r/w mode..."
mount -uw /mnt/app

HMI=$(grep ^HMI /mnt/app/version_info.txt)
BRAND="$(echo $HMI | cut -d'_' -f2)"
REGION="$(echo $HMI | cut -d'_' -f5)"
TYPE="$(echo $HMI | cut -d'_' -f6)"

if [ "$BRAND" = "PAG" ]
then
    echo "Modding fullscreen CarPlay for Porsche PCM 5..."
    if [[ -e "/mnt/app/eso/hmi/lsd/jars" ]]; then
        if [[ -f "$modPath/fc-PCM5.jar" ]]; then
            cp -Vf $modPath/fc-PCM5.jar /mnt/app/eso/hmi/lsd/jars/fc.jar
        else
            echo "error: cannot find $modPath/fc-PCM5.jar"
        fi
    else
        echo "error: /mnt/app/eso/hmi/lsd/jars does not exist"
    fi
elif [ "$BRAND" = "AU" ]
then
    if [ "$TYPE" = "G33" ]
    then
        echo "Modding fullscreen CarPlay for Audi G33..."
        if [[ -e "/mnt/app/eso/hmi/lsd/jars" ]]; then
            if [[ -f "$modPath/fc-AUG33.jar" ]]; then
                cp -Vf $modPath/fc-AUG33.jar /mnt/app/eso/hmi/lsd/jars/fc.jar
            else
                echo "error: cannot find $modPath/fc-AUG33.jar"
            fi
        else
            echo "error: /mnt/app/eso/hmi/lsd/jars does not exist"
        fi
    elif [ "$TYPE" = "G35" ]
    then
        echo "Modding fullscreen CarPlay for Audi G35..."
        if [[ -e "/mnt/app/eso/hmi/lsd/jars" ]]; then
            if [[ -f "$modPath/fc-AUG35.jar" ]]; then
                cp -Vf $modPath/fc-AUG35.jar /mnt/app/eso/hmi/lsd/jars/fc.jar
            else
                echo "error: cannot find $modPath/fc-AUG35.jar"
            fi
        else
            echo "error: /mnt/app/eso/hmi/lsd/jars does not exist"
        fi
    else
        echo "error: Audi unknown"
    fi
elif [ "$BRAND" = "VW" ]
then
    echo "error: Volkswagen"
elif [ "$BRAND" = "LB" ]
then
    echo "error: Lamborghini"
else
    echo "error: $BRAND unknown"
fi

sync
[[ -e "/mnt/app" ]] && umount -f /mnt/app