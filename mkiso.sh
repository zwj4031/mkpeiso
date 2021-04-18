#!/usr/bin/env sh
touch build/ventoy.dat
#mkisofs -udf -d -v -V ChobitPE -no-emul-boot -boot-load-size 8 -b boot/etfsboot.com -e efi/microsoft/boot/efisys_noprompt.bin -o chobitpe.iso -R -U build
rm -rf MiniPE.iso
cp -r *.wim  build/sources/PE64.wim
xorriso -as mkisofs -R -hide-joliet boot.catalog -boot-load-size 4 -b boot/grldr -no-emul-boot -allow-lowercase -boot-info-table \
-eltorito-alt-boot -e efi/microsoft/boot/efisys_noprompt.bin -no-emul-boot -o MiniPE.iso build
rm -f build/sources/PE64.wim
