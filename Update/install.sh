#!/bin/ksh
# Copyright (c) 2025 LawPaul (https://github.com/LawPaul)
# This file is part of MH2p_CarPlay_Fullscreen, licensed under CC BY-NC-SA 4.0.
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# See the LICENSE file in the project root for full license text.
# NOT FOR COMMERCIAL USE

[[ ! -e "/mnt/app" ]] && mount -t qnx6 /dev/mnanda0t177.1 /mnt/app
mount -uw /mnt/app

if [ "$OEM" = "PO" ]; then
    if [[ -e "/mnt/app/eso/hmi/lsd/jars" ]]; then
        if [[ -f "$MOD_PATH/fc-full-$OEM${TYPE}_$RELEASE_TYPE$SOFTWARE_VERSION.jar" ]]; then
            echo "Modding fullscreen CarPlay for Porsche $TYPE $RELEASE_TYPE$SOFTWARE_VERSION..."
            cp -Vf "$MOD_PATH/fc-full-$OEM${TYPE}_$RELEASE_TYPE$SOFTWARE_VERSION.jar" "/mnt/app/eso/hmi/lsd/jars/fc.jar"
        else
            echo "Modding (generic fallback) fullscreen CarPlay for Porsche $TYPE $RELEASE_TYPE$SOFTWARE_VERSION..."
            cp -Vf "$MOD_PATH/fc-full-PO416_P2491.jar" "/mnt/app/eso/hmi/lsd/jars/fc.jar"
        fi
    else
        echo "error: /mnt/app/eso/hmi/lsd/jars does not exist"
    fi
elif [ "$OEM" = "AU" ]; then
    if [[ -e "/mnt/app/eso/hmi/lsd/jars" ]]; then
        if [[ -f "$MOD_PATH/fc-full-$OEM$TYPE.jar" ]]; then
            echo "Modding fullscreen CarPlay for Audi $TYPE..."
            cp -Vf "$MOD_PATH/fc-full-$OEM$TYPE.jar" "/mnt/app/eso/hmi/lsd/jars/fc.jar"
        else
            echo "error: cannot find $MOD_PATH/fc-full-$OEM$TYPE.jar"
        fi
    else
        echo "error: /mnt/app/eso/hmi/lsd/jars does not exist"
    fi
elif [ "$OEM" = "VW" ]; then
    echo "error: Volkswagen"
elif [ "$OEM" = "LB" ]; then
    echo "error: Lamborghini"
else
    echo "error: $OEM unknown"
fi