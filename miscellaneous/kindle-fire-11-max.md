[documents](../README.md) [雑記](./README.md)

Kindle fire 11 max いじり
========================

[2024/12/01 購入](../diary/2024-12.md#1201-diary-on-kindle-fire)。セールでキーボード付きで34000円程度で買えるのは安いと思った。vscode.dev を使って、外出時に日記を書くのに良いのではないだろうかと思って購入した。

色々やってみたけど、ブラウザベースでは「Esc」の入力でホームに戻ってしまうし、x11 はメモリ不足で落ちた時の復帰がだるい。Android 側の Web ブラウザで色々見てると簡単に落とされる。

今のところ上手く行っていないが、アレコレ試して、何が良くて何がダメなのか思い出せないのでメモを作成する。

#### 結局諦めた

このテキストの存在をすっかり忘れてた。色々試して、iPhoneSE3 で構わないということになった。

以前に iPhone で試したときは、vscode.dev には画面が小さ過ぎた。不要な画面要素を十分に減らすことが出来なかった。[もう一度試した](../diary/2025-11.md#1115-vscode-dev-on-iPhone-se3) ところ、サイドバーを閉じて、アクティビティバーを下に移動して、行番号を消して、フォントを小さくしたら十分に使えるサイズになった。

ということで、初期化時間などはまだ不満だが、iPhone は日記には使える。termux-x11 には未練があるけれど。

他にもいくつかの端末を試した。

- Lenovo M10 HD10 2nd Gen .. [Ubuntu Touch が対応している Android 端末](https://devices.ubuntu-touch.io/device/amar-row-lte/)。
  - 遅くて驚いた。
  - [Ubuntu Touch を動かすだけで大変だった](../diary/2025-08.md#0816-Lenovo-m10-gen2)。
  - [使ってみたけど、デスクトップ OS とは感じが違う](../diary/2025-08.md#0821-using-ubuntu-touch)。root 権限で好き勝手にできる感じではないし、それなのにストアにはアプリが少ない。アプリが少ないのは、ビルドしてくれる人が少ないからだろう。開発系のものがかなり少なく、開発者は使ってないようだ。
- MW-WPC04 .. キーボード着脱可能な n4020 の 8 インチ 2in1 端末。
  - [遅過ぎる](../diary/2025-08.md#0817-wpc04)。Windows11 の Windows Update のチェックと Antimalware が裏で動いてると何もできない。ハードウェアスレッドが 2 つしかない CPU では Windows11 を使ってはいけない。
  - まあまあ分厚い。慣れれば問題ないかも知れないが、性能でウンザリしてて試す気にはなれなかった。
  - Linux には十分な性能があるかも知れないけど、逆に分厚さと重さのせいで試す気になれなかった。
- Kingrid T90 .. 11 インチ Android 16 タブレット
  - [Android 16 で Linux が使えるというので買ったんだけど、エラーで動かない](../diary/2025-08.md#0831-kingrid-android16)。
  - Kindle の半分程度の性能しかない。termux なりをインストールして使うにしても、なら Kindle にするでしょ。メモリは多いんだけどね、スワップメモリもあるし。
- Zwide SA11 .. 11 インチ n150 タブレット。着脱可能なキーボードが付いてこないバージョンを入手した
  - [使い物になる処理速度](../diary/2025-09.md#1001-using-sa11)。ハードウェアスレッドが4つあって、Windows Update 関連と Antimalware のプロセスが動いていても、遅くはなるが何もできないということはない。
  - `Loop Hero` を実行しても CPU も GPU も 100% にならない。WPC04 は目一杯だった。
- Google Pixel 6 .. 6.4 インチ Android スマートフォン
  - そもそも iPhone SE の画面が狭過ぎるから Kindle に始まって色々試したのだから、画面が大きめなスマホでいいんじゃないの？ということで試したが、前述のように iPhone SE3 でも使い物になる設定をみつけたので、これは不要になった。
  - Google Pixel を選んだのは、[Android 15 で入った仮想化](https://source.android.com/docs/core/virtualization?hl=ja) 機構の上で動く Linux Terminal が存在するから。Kingrid T90 では動かなかったが、Pixel では動作報告がある。
    - が、なんだったかが動かなかった。何が動かなかったか忘れたが、諦めた。vscode のインストールまではたどり着いてない。
      - 日記はウィンドウマネージャのインストールにすら触れてない。termux-x11 のように、普通に X が使える。
    - で、iPhone 同様にブラウザで vscode.dev を試してみて、画面が広い、ソフトウェアキーボードにカーソル操作がある、という大きな利点はあったが、**単にキーボードの慣れの問題で iPhone でいい** や、となった。
  - やっぱり iPhone と比べると重い。また、縦に遠い範囲をタッチするのにはまだ慣れない。

インストールしたもの
------------------

- Google Play .. Chrome のため
- Google Chrome .. vscode が Chromium ベースなので、その代表的なブラウザとしてインストール。GitHub ログインが上手く行かないことが多くて困った。まだ正確に必要な手順を把握していない
  - vscode.dev .. トンネル接続の GitHub ログインで手間取る。たまにかなりトンネルアクセスが遅い
  - GitHub Codespaces .. 
- Gboard .. 純正 IME は **IME on/off** を「**変換/無変換**」キーに割り当てられなかったので
- Shizuku .. Key Mapper に必要
- Key Mapper .. 「**ホームボタン**」を「**Escキー**」に変換し、「fn + ホームボタン」を本来のホームボタンにするため。ファンクションキーも全部設定するつもりだったが、面倒で後回しにして、運用が上手く行かなかったので放置されている
- Firefox .. Esc キーの挙動チェックのために。ホーム画面に移動した。GitHub ログイン時にポップアップ阻止でトラブルがあったが、挙動を把握したら Chrome よりも
- F-Droid .. USerLAnd と termux のために。その後、他にも色々インストールした
- ??? また別のストア .. 何が欲しかったんだっけ？
- USerLand .. root 不要で Linux のパッケージを色々インストールできる。GUI がまだるっこしいので termux に移行した。理解していないウチは便利だったが
- VNC アプリ沢山 .. 画面タッチやタッチパッド入力の解釈が一長一短で気に入るのが無かった。そして同じ端末で通信してるのに圧縮がかかって電池がもったいない。
- Xserver SDL(XSDL) .. VNC の余計な圧縮などが不要になる。USerLand を使っていた期間はコレだったが、termux-x11 に移行して使わなくなった
- chromium-browser(Ubuntu) .. --no-sandbox が良く分からずに苦戦した。X システムに詳しくなくて、デフォルトブラウザの設定程度でも苦戦した。「アプリケーションとしてインストール」という機能があり、これを使用するとブラウザのアドレスバーが消えるし、ブラウザのショートカットを持って行かないようになる
- vscode for Linux .. やっぱり --no-sandbox で苦戦。
  - x11 で動かしたのは何が不満だったんだっけ？これが入力設定を含めて本命だと思うんだけど、termux-x11 の入力サポートの問題だっけ？
  - サーバとして動かして、Android/termux-x11 どちらのブラウザでも vscode を使用できる。Android 全体のメモリ不足で termux 自体が死ぬと不便
- Firefox for Linux .. Chromium の、「アプリケーションとしてインストール」機能が無い
- termux .. proot-distro を使って、親切な UI の無い UserLand として利用してる
- termux-x11 .. XSDL 同様に X サーバとして動作。XSDL はメンテが止まってるが、こちらはまだ動いてる
- git on Ubuntu repository .. Android 側から参照できるパスに clone したいのに、エラーで出来ない。多分 **Android のファイルシステムから termux の仮想ストレージへのシンボリックリンクを貼ろうとして失敗** してる
- GitHub .. Android 用クライアント。クローンはできない。その場でファイル編集できるので、スマホから細かくコミットしてスカッシュマージするのもいいかも知れないと思ったが、アプリが落ちると編集内容が失われる。惜しい。こういうのを自作してもいいかも
- Git Sync .. Android git client。なんで切ったのか覚えてない
- IzzyOnDroid .. F-Droid とはまた別のストア。PuppyGit をインストールするためにインストールした
- PuppyGit .. クローンが動くことしか試してないかも？
- Spck エディター .. git 操作機能付きの IDE。ブランチ操作が細かくできなそうだから切ったんだっけ？覚えてない
- Squircle CE .. Android 用の IDE。git 操作機能など色々ある。vscode for Linux を諦めて、Android アプリで git アクセスと日記のテキスト編集を試そうとした。他にもいくつか覚えていない不満があったが、日本語入力が出来ずに諦めた。実は Gboard のせいで、純正 IME なら入力できた
- Xed-Editor .. Android 用のテキストエディタ。PuppyGit でお勧めされていた。termux 的な何かを内蔵していて、そこでスクリプトを実行することでエディタの機能拡張を実現している。カスタマイズしがいがあるが、放置してる。これも日本語入力できないと思い込んでいたら Gboard のせいだった
- Markor .. Android 用の Markdown Editor/Viewer アプリ。PuppyGit でお勧めされていた。重いし、キーバインドのカスタマイズ性がそれほどでもない
- Wrix ..  物書き用の和製テキストエディタ。コーディングには向かない

Todo Memo
---------

- タブレットで使っている人が少ないのか、トラックパッドの扱いが丁寧でない気がする
- Web 版
- termux で git はどうだったっけ？
- python で git 上手く行った
  - python -m dulwich -c “porcelain.fetch(‘.’, ‘origin’)”
- Gboard 日本語入力

<!-- cSpell:words Gboard shizuku XSDL proot distro Squircle dulwich Izzy Wrix Spck Zwide -->
