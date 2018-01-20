# fehコマンドで壁紙を変更する
昼と夜の壁紙を別のところから持ってきたかったのでfehコマンドで壁紙を変更できるようにした．
## 昼と夜の分け方
``` bash
now=$(date +"%H")

if [ $now -lt 20 -a $now -gt 6 ]; then
    hogehoge
else
    fugafuga
fi
```
現在時刻を取得し，20時以降と6時以降で取得してくる壁紙のディレクトリを変える．
## 壁紙用のディレクトリを用意する
分ける時間帯の数だけディレクトリを用意する．
私の場合は昼と夜で分けるのでdayLightディレクトリとnightディレクトリの2つを用意した．
## fehコマンドで壁紙を設定する
``` bash
feh --bg-fill `ls -d ~/wallpaper/night/* | shuf -n 1` `ls -d ~/wallpaper/dayLight/* | shuf -n 1`
```
--randmizeオプションでランダムに壁紙を設定できるが，マルチディスプレイで壁紙を設定する時，次のようなコマンドを実行すると，どちらの画面もdayLight,nightの両方のディレクトリからランダムに選ぶ動作をしてしまう．それぞれの画面でそれぞれ指定したディレクトリからランダムに選択するには，ランダムな行から文を取り出す，shufコマンドにlsの実行結果をパイプで渡し，その実行結果をfehの引数として取る．
```bash
feh --bg-fill --randomize ~/wallpaper/night/* ~/wallpaper/dayLight/*
```
## 壁紙切り替えを定時実行する
切り替え実行はsystemdのTimerで行う．servise,timerを作成．
```bash
cd ~/.config/systemd/user/
touch change_wallpaper.service change_wallpaper.timer
```
serviceには定時実行するスクリプトを書く．
``` bash
[Unit]
# サービスの説明
Description=change Wallpaper.

[Service]
Type=simple
# 実行するコマンド(コマンドも含めフルパスでないと動かない)
ExecStart= /bin/bash /home/uhhyoi/wallpaper/scripts/change.sh

[Install]
WantedBy=default.target
```
timerには実行する時間を書く．下の例は15秒毎．
```bash
[Unit]
Description=change wallpaper!

[Timer]
OnBootSec=15s
OnUnitActiveSec=15s
Unit=wallpaper.service

[Install]
WantedBy=timers.target
```

