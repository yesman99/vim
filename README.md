# vim阿部カスタムの使い方

このプロジェクトはvimのsettingを各PC・環境で共有するためのものです。
使い方がわからなくならないためのメモを残しておきます。

## ファイル構成
1. Macvimの設定ファイルが vim/gvimrc
2. ターミナルで使う時のが vim/vimrc

設定の一部は外部ファイル化しており、それらは vim/functions にあります。

## .gitignore ファイルについて
下記2つのフォルダについてはgitの管理から外しています。

* vim/backup
* vim/bundle

初めて`git clone`して使う場合は、これらのディレクトリを手動で生成する必要があるかも。

## 適用方法

``` コマンドライン(MacOS)
ln -s vim/gvimrc .gvimrc
ln -s vim/vimrc  .vimrc
```
