@echo off
setlocal enabledelayedexpansion

:: .env ファイルから変数を読み込む
for /f "usebackq tokens=1,2 delims==" %%i in (".env") do (
    set %%i=%%j
)

:: デフォルト設定（.envがなければ "main"）
if not defined PDFNAME set PDFNAME=main
set INPDF=%PDFNAME%.pdf
set OUTPDF=%PDFNAME%_embed.pdf

echo === フォント完全埋め込み: %INPDF% → %OUTPDF% ===
gswin64c -dNOPAUSE -dBATCH -sDEVICE=pdfwrite ^
 -dPDFSETTINGS=/prepress ^
 -dEmbedAllFonts=true -dSubsetFonts=false ^
 -sOutputFile=%OUTPDF% %INPDF%

echo.
echo end
endlocal
pause
