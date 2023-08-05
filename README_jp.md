### [English Documentation Available Here](https://github.com/KabanFriends/Touhou-Figura-Pack/blob/master/README.md)

<p align="center">
    <img width="1280" src="https://media.discordapp.net/attachments/917345899389255691/1137095587687313508/tfp_thumbnail_jp.jpg" alt="title">
</p>

# Touhou Figura Pack
Touhou Figura Packは、Minecraftのmod「[Figura](https://modrinth.com/mod/figura)」専用のプレイヤーモデルパックです。このモデルパックには、[Touhou Little Maid](https://www.curseforge.com/minecraft/mc-mods/touhou-little-maid)から移植した東方Projectのキャラクターのモデルと、その他のおまけモデルが収録されています。

このモデルパックに含まれるモデル・テクスチャーは、Touhou Little Maidから**非公式**に移植されたものです。モデルパックの作者(KabanFriends)は、Touhou Little Maidやその作者であるTartaricAcid氏と関係がありません。

# パック内のモデル
このモデルパックには、[Figura](https://modrinth.com/mod/figura)に対応したプレイヤーモデルが合計133種類含まれています。

- 東方Projectのキャラクターのプレイヤーモデル 121種類
- 一部キャラクターの装飾品やその他のおまけモデル 12種類

モデルによっては、Action Wheelを使って特別な機能が使えるものがあります。

# 使用方法
1. [Figura](https://modrinth.com/mod/figura)をMinecraftに導入する
2. Touhou Figura Packの[最新バージョン](https://github.com/KabanFriends/Touhou-Figura-Pack/releases/latest)をダウンロードする
3. ダウンロードした.zipファイルを `.minecraft/figura/avatars` にコピーする
4. FiguraのWardrobeメニューでプレイヤーモデルを選ぶ
- Figuraの設定画面(Settings)から、**First Person Hands**をONにすることを推奨します。

# 手動で「ビルド」して使う方法
Releasesページからビルド済みのモデルパックをダウンロードせずに、このリポジトリーから直接プレイヤーモデルを使用する際は、以下の手順で全モデル共通のスクリプトをインストールする必要があります。

1. Python 3.9 をインストールする (他のバージョンでは動作確認していません)
2. カレントディレクトリーを`.scripts`にした状態で`build.py`を実行する
```sh
cd ./.scripts
python ./build.py
```
3. 自動的に、各モデルに必要なスクリプトがインストールされます

# 帰属表示
Touhou Figura Packで使用されるモデルやテクスチャーは、TartaricAcid氏制作の[Touhou Little Maid](https://www.curseforge.com/minecraft/mc-mods/touhou-little-maid)から移植されています。
モデルやテクスチャーは、[CC BY NC SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)ライセンスの許容範囲で改変されています。
