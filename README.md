# PDFフォント埋め込みスクリプト

LaTeX で作成した PDF を学会などに提出する際、

> フォントが埋め込まれていません  

といった警告が出ることがあります。

本スクリプトを使えば、**Ghostscript** によって **すべてのフォントを埋め込んだ PDF** を作成できます。

## ファイル構成

| ファイル名 | 説明 |
|------------|------|
| `build.bat` | LaTeX ソース（main.tex）から PDF（main.pdf）を生成 |
| `convert.bat` | `main.pdf` を完全フォント埋め込みの `main_embed.pdf` に変換 |

## 対応環境

- **Windows**
- [Ghostscript](https://ghostscript.com/releases/gsdnld.html) がインストールされていること
  - `gswin64c.exe` にパスが通っていない場合は、バッチファイル内のパスを編集してください
- **texlive**

## 使い方

1. LaTeX で作成した `main.pdf` をこのフォルダに置く  
2. `embed_fonts.bat` をダブルクリック（または右クリック → 実行）  
3. `main_embed.pdf` が生成されます

## .env ファイルで対象ファイルを指定

このスクリプトは、`.env` ファイルからpdfの名前やtexの名前を指定して、変換やビルドすることもできます。
