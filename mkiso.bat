@pushd "%~dp0" >nul 2>&1

@echo off & pushd "%~dp0"
mode con cols=66 lines=26
:menu
if not "%1" == "" set wim=%1&&goto mkiso
echo 清！真！
echo 双启ISO[BIOS/EFI64]位保证转圈圈制作器
echo 支持粘帖wim或将wim文件拖到bat文件上
echo 请选择当前目录下的wim来制作成iso
echo __________________________________
setlocal enabledelayedexpansion
set n=0
for /f %%i in ('dir /b %~dp0*.wim') do (
set /a n+=1
set pc!n!=%%i
@echo !n!.%%i  
)
echo __________________________________
echo [史上最伟大网管瞎搞工作室出品]
set /p sel=请选择数字:
set wim=!pc%sel%!


:mkiso
::注入转圈圈文件
echo 正在注入转圈圈文件……
bin\wimlib update %wim% --command="add 'build\boot\resources\bootres.dll' '\Windows\Boot\Resources\bootres.dll'"
for /f %%i in ('dir /b build\boot\fonts\*.*') do (
echo 注入%%i 到boot.wim!
bin\wimlib update %wim% --command="add 'build\boot\fonts\%%i' '\Windows\Boot\Fonts\%%i'"
)
@echo 转圈圈文件注入完成！
echo 复制%wim%到b油哦德目录....
copy /y "%wim%" %~dp0build\sources\PE64.wim
cd /d %~dp0
echo . build\ventoy.dat
%~dp0bin\mkisofs.exe -udf -d -v -V MiniPE -no-emul-boot -boot-load-size 4 -b boot/grldr -eltorito-platform efi -b efi/microsoft/boot/efisys_noprompt.bin -o MiniPE.iso -R -U build
cls
echo 会转圈圈的ISO文件打包完成，保存在：%~dp0WinPE.iso
echo .... 会转圈圈哦~ ....
echo .... 会转圈圈哦~ ....
@echo 清理wim文件...
del /s /Q %~dp0build\sources\PE64.wim>nul
echo __________________________________
echo r [再来一个]
echo q [退出]
echo [史上最伟大网管瞎搞工作室出品]
set /p user_input=请输入：

if %user_input% equ r cls&&goto menu
if %user_input% equ q exit
pause
