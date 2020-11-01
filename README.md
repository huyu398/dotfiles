# dotfiles

初期設定として行うことのメモ

## Windows

#### グループポリシーエディターを有効にする

1. 以下の内容でバッチファイル (gpedit_enable.bat) を保存する
   ```dosbatch
   @echo off 
   pushd "%~dp0" 

   dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt 
   dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt 

   for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i" 
   pause
   ```
2. 管理者権限でバッチファイルを実行する
3. \[Win] + \[R] でファイル名を指定して実行を開き，`gpedit.msc` を実行する

#### Win32 の長いパスを有効にする

1. グループポリシーの編集を開く
2. コンピューターの構成 > 管理用テンプレート > システム > ファイルシステム をクリック

参考
* [[win10]Could not install packages due to an EnvironmentError: [Errno 2] No such file or directory](https://qiita.com/y-shoji/items/19def45edf582646f584)
