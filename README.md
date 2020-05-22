# Nginx fragile settings hands-on

## build

`docker build -t vuln-nginx .`

## run

`docker run -d -p 127.0.0.1:80:80 vuln-nginx`

## 紹介している設定

### HTTP Splitting

http://127.0.0.1/split/

### Path Traversal

http://127.0.0.1/path/

### Multiple response headers

http://127.0.0.1/header/

### バージョン情報

httpディレクティブに`server_tokens:off;`を設定済です。
Response Headerには`Server: nginx`と表示されバージョン情報が表示されません。

## 参考

特に[@noisy_sec](https://qiita.com/no1zy_sec)のqiitaを参考にしました。

[HTTP Splitting](https://qiita.com/no1zy_sec/items/fe7c44b5a0fdd4807bbe)

[Path Traversal](https://qiita.com/no1zy_sec/items/e541f1c838874ff400bb)

[Multiple response headers](https://qiita.com/no1zy_sec/items/da280cb5c1e154babe2a)
