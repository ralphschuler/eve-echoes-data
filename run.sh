#!/bin/bsh

unzip -o /data/eve.xapk -d /data/eve
unzip -o $(find /data/eve -type f -name "*.obb") -d /data/obb

find /data/obb -type f -name "*.npk" -exec /neox-tools/target/release/npktool x {} -d /data/npk/{} \;
find /data/npk -type f -name "*.ktx" -exec /fbxconvert/${ARCH}/PVRTexTool/PVRTexToolCLI -i {} -f r8g8b8a8 -d {}.png \;

python3 /eve-echoes-tools/scripts/dump_static_data.py /data/eve.xapk /data