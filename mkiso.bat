cd /d %~dp0
echo . build\ventoy.dat
%~dp0bin\mkisofs -udf -v -V ChobitPE -no-emul-boot -boot-load-size 4 -b boot/etfsboot.com -eltorito-platform efi -b efi/microsoft/boot/efisys_noprompt.bin -o chobitpe.iso -R -U build
echo ok.
exit