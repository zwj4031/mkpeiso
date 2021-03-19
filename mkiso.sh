#!/usr/bin/env sh
touch build/ventoy.dat
#mkisofs -udf -d -v -V ChobitPE -no-emul-boot -boot-load-size 8 -b boot/etfsboot.com -e efi/microsoft/boot/efisys_noprompt.bin -o chobitpe.iso -R -U build
rm -rf chobitpe.iso
xorriso -as mkisofs -R -hide-joliet boot.catalog -boot-load-size 8 -b boot/etfsboot.com  -no-emul-boot -allow-lowercase -boot-load-size 8 -boot-info-table \
-eltorito-alt-boot -e efi/microsoft/boot/efisys_noprompt.bin -no-emul-boot -o chobitpe.iso build
