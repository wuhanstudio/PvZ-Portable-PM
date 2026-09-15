#!/bin/bash
# PORTMASTER: PvZ-Portable.zip, PvZ-Portable.sh

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
source $controlfolder/device_info.txt
source $controlfolder/tasksetter

[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"
get_controls

gamedir="/$directory/ports/PvZ-Portable"
cd "$gamedir/"

# Grab text output...
$ESUDO chmod 666 /dev/tty0
printf "\033c" > /dev/tty0
echo "Loading... Please Wait." > /dev/tty0

# Request libGL from Portmaster
if [ -f "${controlfolder}/libgl_${CFW_NAME}.txt" ]; then
  source "${controlfolder}/libgl_${CFW_NAME}.txt"
else
  source "${controlfolder}/libgl_default.txt"
fi


# if [[ "$LIBGL_ES" != "" ]]; then
#  export SDL_VIDEO_GL_DRIVER="${gamedir}/gl4es/libGL.so.1"
#  export SDL_VIDEO_EGL_DRIVER="${gamedir}/gl4es/libEGL.so.1"
# fi

export SDL_MOUSE=1
export SDL_ENABLE_MOUSE=1
export LD_LIBRARY_PATH="/$gamedir/libs.aarch64:$LD_LIBRARY_PATH"

# Jump into the gamedata dir now
cd "$gamedir/"

gameassembly="pvz_portable.aarch64"

$GPTOKEYB "${gameassembly}" -c gptokeyb.ini &
$TASKSET "./${gameassembly}" 2>&1 | tee "${gamedir}/log.txt"
$ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events &

# Disable console
printf "\033c" >> /dev/tty1
