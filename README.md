## Obsidian-Web

基于[perlite](https://github.com/secure-77/perlite)项目构建

## 目的

使用一个容器启动

## 发布到 DockerHub

commmit message 以 publish 开头

```
git commit -m "publish: 发布"
```

## ClawCloud

```
NOTES_PATH=blog
HIDE_FOLDERS=docs,private,trash,lost+found
HIDDEN_FILE_ACCESS=false
LINE_BREAKS=true
ABSOLUTE_PATHS=false
ALLOWED_FILE_LINK_TYPES=pdf,mp4
DISABLE_POP_HOVER=false
SHOW_TOC=true
SHOW_LOCAL_GRAPH=true
HOME_FILE=README
FONT_SIZE=15
HTML_SAFE_MODE=true
TEMP_PATH=/tmp
SITE_TITLE=six
SITE_TYPE=article
SITE_URL=
SITE_IMAGE=
SITE_DESC=
SITE_NAME=Perlite
SITE_TWITTER=https://x.com/
SITE_LOGO=perlite.svg
SITE_HOMEPAGE=https://www.baidu.com/
SITE_GITHUB=https://github.com/sixmillions
```

```
/etc/nginx/http.d/default.conf

server {
    listen 80;
    server_name localhost;

    root /var/www/perlite;
    index index.php index.html index.htm;

    access_log /var/log/nginx/php-access.log;
    error_log /var/log/nginx/php-error.log;


    location / {
        try_files $uri $uri/ /index.php;
    }

    # PHP-FPM Configuration Nginx
    location ~ \.php$ {
        try_files $uri = 404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param REQUEST_URI $request_uri;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

	location ~ /\.ht {
            deny all;
    }

    location ~* ^/(.*)/.obsidian/appearance.json$ {
        allow all;
    }

    location ~* ^/(.*)/.obsidian/(.*)/theme.css$ {
        allow all;
    }

    location ~ \.(git|github|obsidian|trash) {
        deny all;
    }

    location ~ \.(md|json)$ {
        deny all;
    }

}

```

```
/var/www/perlite/blog
```
