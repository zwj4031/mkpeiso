:::: -boot-load-size 4为grldr之类，4k以上的文件填8 或取消参数
cd /d %~dp0
echo . build\ventoy.dat
%~dp0bin\mkisofs.exe -udf -d -v -V ChobitPE -no-emul-boot -boot-load-size 4 -b boot/grldr -eltorito-platform efi -b efi/microsoft/boot/efisys_noprompt.bin -o chobitpe.iso -R -U build
echo ok.
exit