#!/data/data/com.termux/files/usr/bin/bash
RESTART_INSTRUCTIONS="Dropping to shell. To rebuild, swipe from the top of your screen, touch the arrow on the right side of your Termux Notificiation, touch "Exit", then relaunch this app."
if ! ls /storage/emulated/0 >/dev/null 2>&1
then
    yes | pkg install termux-am
	yes | termux-setup-storage
fi
cat <<EOF 
___  _  _ _ _    ___  ____ ____
|__] |  | | |    |  \ |___ |__/
|__] |__| | |___ |__/ |___ |  \\
EOF
# https://stackoverflow.com/questions/34457830/press-any-key-to-abort-in-5-seconds
if read -r -s -n 1 -t 5 -p "Press any key within 5 seconds to cancel build" key #key in a sense has no use at all
then
	echo && echo $RESTART_INSTRUCTIONS
	exit 0
fi
yes | termux-wake-lock
    cp /storage/emulated/0/Download/baserom.us.z64 ~/
    cp /storage/emulated/0/baserom.us.z64 ~/
echo 'Autodetecting baserom.us.z64. This can take a long time.'
if [ -f ~/baserom.us.z64 ]
then
	BASEROM_PATH=~/baserom.us.z64
else
	BASEROM_PATH=$(find /storage/emulated/0 -type f -exec md5sum {} + 2>/dev/null | grep '^20b854b239203baf6c961b850a4a51a2' | head -n1 | cut -d'/' -f2- | xargs -I "%" echo /%)
fi
BLOCKS_FREE=$(awk -F ' ' '{print $4}' <(df | grep emulated))
if (( 2097152 > BLOCKS_FREE ))
then
	cat <<EOF
____ _  _ _    _   
|___ |  | |    |   
|    |__| |___ |___
EOF
    echo 'Your device storage needs at least 2 GB free space to continue!'
	echo $RESTART_INSTRUCTIONS
	exit 1
fi
if [ -z "${BASEROM_PATH}" ]
then
	cat <<EOF
_  _ ____    ____ ____ _  _
|\ | |  |    |__/ |  | |\/|
| \| |__|    |  \ |__| |  |
EOF
    echo 'Go to https://github.com/sanni/cartreader to learn how to get baserom.us.z64'
	echo $RESTART_INSTRUCTIONS
	exit 2
else
	cp "${BASEROM_PATH}" ~/baserom.us.z64
fi
    rm -rf sm64ex-alo
apt-mark hold bash
yes | pkg upgrade -y
yes | pkg install git wget make python getconf zip apksigner clang binutils libglvnd-dev aapt which netcat-openbsd
cd
if [ -d "sm64ex-alo" ]
then
	cp "${BASEROM_PATH}" sm64ex-alo/baserom.us.z64
	cd sm64ex-alo
	git reset --hard HEAD
	git pull origin master
	git submodule update --init --recursive
	make distclean
else
	git clone https://github.com/AloUltraExt/sm64ex-alo.git
	wget https://github.com/izzy2fancy/sm64ex-alo-izzys/blob/master/platform/android/getSDL.sh -d ./sm64ex-alo/platform/android/
	wget https://github.com/izzy2fancy/sm64ex-alo-izzys/releases/download/3.0/star-road-assets.zip
yes | unzip star-road-assets.zip -d ./sm64ex-alo/platform/android/android/
	wget -P sm64ex-alo/enhancements https://github.com/izzy2fancy/sm64ex-alo-izzys/releases/download/2.0/star.patch
	cd sm64ex-alo
    git checkout 4d2cfbb9eaa63bca2fe8db2ebd7effac6743409f
    chmod -R 777 .
	cd platform/android/ && ./getkhrplatform.sh && ./getSDL.sh && cd ../..
yes | tools/apply_patch.sh enhancements/star.patch
    cp ~/baserom.us.z64 ~/sm64ex-alo/baserom.us.z64
fi
make RM2C=1 2>&1 | tee build.log
if ! [ -f build/us_android/sm64.us.f3dex2e.apk ]
then
	cat <<EOF
____ ____ _ _    _  _ ____ ____
|___ |__| | |    |  | |__/ |___
|    |  | | |___ |__| |  \ |___
EOF
    echo 'Send this URL to owokitty on Discord:'
    cat build.log | nc termbin.com 9999
	echo $RESTART_INSTRUCTIONS
	exit 3
fi
cp build/us_android/sm64.us.f3dex2e.apk /storage/emulated/0
cat <<EOF
___  ____ _  _ ____
|  \ |  | |\ | |___
|__/ |__| | \| |___
EOF
echo 'Go to Files and touch sm64.us.f3dex2e.apk to install!'
yes | termux-wake-unlock
echo $RESTART_INSTRUCTIONS