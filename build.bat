@echo off
setlocal enabledelayedexpansion

:: .env ファイルから変数を読み込む
for /f "usebackq tokens=1,2 delims==" %%i in (".env") do (
    set %%i=%%j
)

:: デフォルト設定（.envがなければ "main"）
if not defined TEXNAME set TEXNAME=main
set TEXFILE=%TEXNAME%.tex

cd /d %~dp0

rem --- upLaTeX + biber + dvipdfmx ---
uplatex -interaction=nonstopmode -file-line-error "%TEXFILE%"
biber "%TEXNAME%"
uplatex -interaction=nonstopmode -file-line-error "%TEXFILE%"
uplatex -interaction=nonstopmode -file-line-error "%TEXFILE%"

rem ここで必ず埋め込みを試みる
dvipdfmx -E "%TEXNAME%.dvi"

echo.
echo === 完了: %TEXNAME%.pdf を生成しました ===
endlocal
