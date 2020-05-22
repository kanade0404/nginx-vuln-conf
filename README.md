# Nginx fragile settings hands-on

## Environments

### OS

`$ sw_vers`

```bash
ProductName:    Mac OS X
ProductVersion: 10.14.6
BuildVersion:   18G4032
```

### Version

### nginx

`$ nginx -v`
`nginx version: nginx/1.17.8`

#### Docker

`$ docker version`

```bash
Client: Docker Engine - Community
 Version:           19.03.8
 API version:       1.40
 Go version:        go1.12.17
 Git commit:        afacb8b
 Built:             Wed Mar 11 01:21:11 2020
 OS/Arch:           darwin/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.8
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.17
  Git commit:       afacb8b
  Built:            Wed Mar 11 01:29:16 2020
  OS/Arch:          linux/amd64
  Experimental:     true
 containerd:
  Version:          v1.2.13
  GitCommit:        7ad184331fa3e55e52b890ea95e65ba581ae3429
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

## build

`docker build -t vuln-nginx .`

## run

`docker run -d -p 127.0.0.1:80:80 vuln-nginx`

## 紹介している設定

### HTTP splitting

http://127.0.0.1/split/

### Path traversal

http://127.0.0.1/path/

### Multiple response headers

http://127.0.0.1/header/

### Server version info

httpディレクティブに`server_tokens:off;`を設定済です。  
Response Headerには`Server: nginx`と表示されバージョン情報が表示されません。

## 参考

特に[@noisy_sec](https://qiita.com/no1zy_sec)のqiitaを参考にしました。

[HTTP Splitting](https://qiita.com/no1zy_sec/items/fe7c44b5a0fdd4807bbe)

[Path Traversal](https://qiita.com/no1zy_sec/items/e541f1c838874ff400bb)

[Multiple response headers](https://qiita.com/no1zy_sec/items/da280cb5c1e154babe2a)
