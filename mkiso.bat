@pushd "%~dp0" >nul 2>&1

@echo off & pushd "%~dp0"
mode con cols=66 lines=26
:menu
if not "%1" == "" set wim=%1&&goto mkiso
echo �壡�棡
echo ˫��ISO[BIOS/EFI64]λ��֤תȦȦ������
echo ֧��ճ��wim��wim�ļ��ϵ�bat�ļ���
echo ��ѡ��ǰĿ¼�µ�wim��������iso
echo __________________________________
setlocal enabledelayedexpansion
set n=0
for /f %%i in ('dir /b %~dp0*.wim') do (
set /a n+=1
set pc!n!=%%i
@echo !n!.%%i  
)
echo __________________________________
echo [ʷ����ΰ������Ϲ�㹤���ҳ�Ʒ]
set /p sel=��ѡ������:
set wim=!pc%sel%!


:mkiso
::ע��תȦȦ�ļ�
echo ����ע��תȦȦ�ļ�����
bin\wimlib update %wim% --command="add 'build\boot\resources\bootres.dll' '\Windows\Boot\Resources\bootres.dll'"
for /f %%i in ('dir /b build\boot\fonts\*.*') do (
echo ע��%%i ��boot.wim!
bin\wimlib update %wim% --command="add 'build\boot\fonts\%%i' '\Windows\Boot\Fonts\%%i'"
)
@echo תȦȦ�ļ�ע����ɣ�
echo ����%wim%��b��Ŷ��Ŀ¼....
copy /y "%wim%" %~dp0build\sources\PE64.wim
cd /d %~dp0
echo . build\ventoy.dat
%~dp0bin\mkisofs.exe -udf -d -v -V MiniPE -no-emul-boot -boot-load-size 4 -b boot/grldr -eltorito-platform efi -b efi/microsoft/boot/efisys_noprompt.bin -o MiniPE.iso -R -U build
cls
echo ��תȦȦ��ISO�ļ������ɣ������ڣ�%~dp0WinPE.iso
echo .... ��תȦȦŶ~ ....
echo .... ��תȦȦŶ~ ....
@echo ����wim�ļ�...
del /s /Q %~dp0build\sources\PE64.wim>nul
echo __________________________________
echo r [����һ��]
echo q [�˳�]
echo [ʷ����ΰ������Ϲ�㹤���ҳ�Ʒ]
set /p user_input=�����룺

if %user_input% equ r cls&&goto menu
if %user_input% equ q exit
pause
