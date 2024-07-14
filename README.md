# Alphapolis Downloader Documentation
## Creator
### My info
YouTube: https://youtube.com/@tanahiro2010<br>
Twitter: https://twitter.com/tanahiro2010<br>
Discord: https://discord.gg/6GF2RSK6j7<br>
Site: https://tanahiro2010.cloudfree.jp and https://tanahiro2010.zatunen.com

### Zisty's info
Twitter: https://twitter.com/TeamZisty<br>
Site: https://zisty.net<br>
Discord: https://discord.gg/jjqCGjm2Tw

# Japanese
# Alphapolis Downloader ドキュメント

## 作成者
### 私の情報
YouTube: [tanahiro2010](https://youtube.com/@tanahiro2010)<br>
Twitter: [tanahiro2010](https://twitter.com/tanahiro2010)<br>
Discord: [6GF2RSK6j7](https://discord.gg/6GF2RSK6j7)<br>
サイト: [tanahiro2010.cloudfree.jp](https://tanahiro2010.cloudfree.jp) および [tanahiro2010.zatunen.com](https://tanahiro2010.zatunen.com)

### Zistyの情報
Twitter: [TeamZisty](https://twitter.com/TeamZisty)<br>
サイト: [zisty.net](https://zisty.net)<br>
Discord: [jjqCGjm2Tw](https://discord.gg/jjqCGjm2Tw)

## アプリケーション
使用方法の詳細については、以下のコマンドを使用してください。
```sh
Alphapolis -help
```

## 概要

`Alphapolis Downloader`は、Alphapolisウェブサイトから小説をダウンロードするためのRubyスクリプトです。ユーザーは作家IDと本IDを指定して、指定された本の内容を取得して保存することができます。

## ファイル

### 1. `main.rb`

これは、ユーザー入力を処理し、ダウンロードプロセスを開始するメインスクリプトです。

### 2. `system/alphapolis.rb`

このファイルには、実際の小説コンテンツのダウンロードと処理を行う`Alphapolis`モジュールと`App`クラスが含まれています。

## 使用方法

### スクリプトの実行

スクリプトを実行するには、以下のコマンドを使用します。

```sh
ruby main.rb
```

### コマンドライン引数

スクリプトは、コマンドライン引数の有無にかかわらず実行できます。

1. **引数なし**: 引数が提供されていない場合、スクリプトは対話モードに入り、ユーザーに入力を促します。
2. **1つの引数**: 1つの引数が提供された場合、それは`-help`でなければなりません。使用方法情報を表示します。
3. **2つの引数**: 2つの引数が提供された場合、それらは`writer_id`と`book_id`でなければなりません。

#### 例

```sh
ruby main.rb 12345 67890
```

### 対話モード

コマンドライン引数が提供されていない場合、スクリプトは以下の形式でユーザーに入力を促します。

```
exit or writer_id:book_id $
```

- **exit**: `exit`と入力してスクリプトを終了します。
- **writer_id:book_id**: 作家IDと本IDをコロンで区切って入力し、ダウンロードプロセスを開始します。

スクリプトは確認を求めます。

```
Are you ok ( y / n ) ?
```

- **y**または**yes**: ダウンロードを続行します。
- **n**または**no**: ダウンロードをキャンセルします。

## Alphapolis モジュール

### `Alphapolis::App` クラス

#### 初期化

`App`クラスは、`writer_id`と`book_id`を含むオプションのデータで初期化できます。

```ruby
def initialize(data = nil)
  @writer_id = data[:writer_id] unless data.nil? || data[:writer_id].nil?
  @book_id = data[:book_id] unless data.nil? || data[:book_id].nil?
end
```

#### メソッド

##### `download(writer_id = @writer_id, book_id = @book_id)`

このメソッドは小説コンテンツのダウンロードを処理します。以下の手順を実行します。

1. **検証**: `writer_id`と`book_id`が提供されているかを確認します。
2. **URL構築**: 提供されたIDに基づいて本のURLを構築します。
3. **HTTPリクエスト**: 本のメインページを取得するためにHTTP GETリクエストを送信します。
4. **コンテンツ解析**: Nokogiriを使用してHTMLコンテンツを解析し、タイトルとエピソードURLを抽出します。
5. **エピソードダウンロード**: 各エピソードURLを反復処理し、HTTP GETリクエストを送信してエピソードテキストを抽出します。
6. **ファイル書き込み**: 収集したテキストを本のタイトルにちなんで名付けられたファイルに書き込みます。

### エラーハンドリング

スクリプトには、IDの欠如、404レスポンス、コンテンツの欠如などのシナリオを処理するためのさまざまなエラーチェックとメッセージが含まれています。

## 依存関係

スクリプトは以下のRuby gemsを必要とします。

- `net/http`
- `nokogiri`
- `json`

スクリプトを実行する前に、これらのgemをインストールしてください。

```sh
gem install net-http
gem install nokogiri
gem install json
```

## 例

以下は、対話モードでスクリプトを実行する例です。

```sh
ruby main.rb
```

```
exit or writer_id:book_id $ 12345:67890
Writer_id: 12345
Book_id: 67890
Are you ok ( y / n ) ? y
[INFO] Writer ID: 12345
[INFO] Book ID: 67890
[INFO] Book URL: https://www.alphapolis.co.jp/novel/12345/67890
[INFO] Book_title: Example Book Title
[LOG]  Downloading... https://www.alphapolis.co.jp/novel/12345/67890/episode/1 (1/10)
...
```

スクリプトはコンテンツをダウンロードし、`Example Book Title.txt`という名前のファイルに保存します。

---

このドキュメントは、Alphapolis Downloaderスクリプトの包括的な理解と効果的な使用方法を提供するはずです。さらに質問がある場合や追加の詳細が必要な場合は、お気軽にお尋ねください！
# English
## Application
For details on how to use it, please use the following command
```sh
Alphapolis -help
```

## Overview

The `Alphapolis Downloader` is a Ruby script designed to download novels from the Alphapolis website. It allows users to specify a writer ID and book ID to fetch and save the content of the specified book.

## Files

### 1. `main.rb`

This is the main script that handles user input and initiates the download process.

### 2. `system/alphapolis.rb`

This file contains the `Alphapolis` module and the `App` class, which handle the actual downloading and processing of the novel content.

## Usage

### Running the Script

To run the script, you can use the following command:

```sh
ruby main.rb
```

### Command-Line Arguments

The script can be run with or without command-line arguments:

1. **No Arguments**: If no arguments are provided, the script enters an interactive mode where it prompts the user for input.
2. **One Argument**: If one argument is provided, it must be `-help` to display usage information.
3. **Two Arguments**: If two arguments are provided, they should be the `writer_id` and `book_id`.

#### Example

```sh
ruby main.rb 12345 67890
```

### Interactive Mode

If no command-line arguments are provided, the script will prompt the user for input in the following format:

```
exit or writer_id:book_id $
```

- **exit**: Type `exit` to terminate the script.
- **writer_id:book_id**: Provide the writer ID and book ID separated by a colon to initiate the download process.

The script will then ask for confirmation:

```
Are you ok ( y / n ) ?
```

- **y** or **yes**: Proceed with the download.
- **n** or **no**: Cancel the download.

## Alphapolis Module

### `Alphapolis::App` Class

#### Initialization

The `App` class can be initialized with optional data containing `writer_id` and `book_id`.

```ruby
def initialize(data = nil)
  @writer_id = data[:writer_id] unless data.nil? || data[:writer_id].nil?
  @book_id = data[:book_id] unless data.nil? || data[:book_id].nil?
end
```

#### Methods

##### `download(writer_id = @writer_id, book_id = @book_id)`

This method handles the downloading of the novel content. It performs the following steps:

1. **Validation**: Checks if `writer_id` and `book_id` are provided.
2. **URL Construction**: Constructs the URL for the book based on the provided IDs.
3. **HTTP Request**: Sends an HTTP GET request to fetch the book's main page.
4. **Content Parsing**: Uses Nokogiri to parse the HTML content and extract the title and episode URLs.
5. **Episode Download**: Iterates through each episode URL, sends an HTTP GET request, and extracts the episode text.
6. **File Writing**: Writes the collected text to a file named after the book title.

### Error Handling

The script includes various error checks and messages to handle scenarios such as missing IDs, 404 responses, and missing content.

## Dependencies

The script requires the following Ruby gems:

- `net/http`
- `nokogiri`
- `json`

Make sure to install these gems before running the script:

```sh
gem install net-http
gem install nokogiri
gem install json
```

## Example

Here is an example of running the script in interactive mode:

```sh
ruby main.rb
```

```
exit or writer_id:book_id $ 12345:67890
Writer_id: 12345
Book_id: 67890
Are you ok ( y / n ) ? y
[INFO] Writer ID: 12345
[INFO] Book ID: 67890
[INFO] Book URL: https://www.alphapolis.co.jp/novel/12345/67890
[INFO] Book_title: Example Book Title
[LOG]  Downloading... https://www.alphapolis.co.jp/novel/12345/67890/episode/1 (1/10)
...
```

The script will download the content and save it to a file named `Example Book Title.txt`.

---

This documentation should provide a comprehensive understanding of the Alphapolis Downloader script and how to use it effectively. If you have any further questions or need additional details, feel free to ask!