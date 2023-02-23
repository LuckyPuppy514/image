@echo off
setlocal enabledelayedexpansion
:: 批量压缩处理当前目录图片：格式转换 + 调整尺寸 + 压缩 + 重命名

:: ffmpeg 路径
set ffmpegPath=D:\office\ShareX\ffmpeg.exe

:: 输入格式
set inputExt=*.jpg,*.png,*.webp
:: 输出格式
set outputExt=.webp
:: 输出目录
set outputPath=output

:: pc
set length=-1
set width=1080
:: mobile
:: set length=720
:: set width=-1

:: 压缩质量（1 - 100）
set quanlity=75

md %outputPath%
set /a index=1
for %%a in (%inputExt%) do (
	rem 原名
	rem set "filename=%%~na%outputExt%"
	rem 枚举
	set filename=!index!
	set filename=000000!filename!
	set filename=!filename:~-6!
	set filename=!filename!%outputExt%
	set /a index+=1
	if /i %%~xa==%outputExt% (
		copy %%a %outputPath%\!filename!
	) else (
		%ffmpegPath% -i "%%a" -vf scale=%length%:%width% -q %quanlity% "%outputPath%\!filename!"
	)
)

::pause
