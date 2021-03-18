#!/usr/bin/env sh
touch build/ventoy.dat
mkisofs -udf -boot.catalog -b boot/etfsboot.com  -v -V ChobitPE -e efi/microsoft/boot/efisys_noprompt.bin -no-emul-boot -o chobitpe.iso -R -U /mnt/s/git/mk/build