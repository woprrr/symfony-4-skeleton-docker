# Configure PHPStorm for MacOS

## Edit PHP configuration

![PHP CLI Interpreter](images/ps-mac-php-interpreter-01.png)

## Add a PHP interpreter

![ADD PHP CLI Interpreter](images/ps-mac-php-interpreter-02.png)

## Configure XDebug

### Edit `docker-compose.yml` file

Edit the following part :

```yml
    php:
        environment:
            XDEBUG_CONFIG: "remote_host=docker.for.mac.localhost idekey=IDE_XDEBUG"
            PHP_IDE_CONFIG: "serverName=docker-server"
```

1. Adjust `XDEBUG_CONFIG` if you're using Linux (remote_host=docker.for.win.localhost) or Windows (remote_host=172.17.0.1).
2. Edit `PHP_IDE_CONFIG` or Add a serverName named `docker-server` and set absolute path /app/symfony for ./symfony folder @see [How to add debug server](#xdebug-server)

### Check Debug section

![Xdebug](images/ps-mac-php-xdebug.png)

### Add a debug server

![XDebug Server](images/ps-mac-php-xdebug-server.png)
