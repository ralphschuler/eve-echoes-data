#!/bin/bsh

unzip /data/eve.xapk -d /data/eve
unzip $(find /data -type f -name "*.obb") -d /data/obb

mv $(find /data/eve -type f -name "*.npk") /data/npk

/neox-tools/target/release/neox-tools x $(find /data/npk -type f -name "*.npk")