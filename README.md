# php-mssql-sqlsrv
A php container with sqlsrv and Microsoft ODBC drivers installed for development and production.
Based on [Official PHP image](https://hub.docker.com/_/php/) and [Official Microsoft ODBC driver for SQL Server (Linux) Tutorial](https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server).

This repository also includes example on running the MSSQL server and connecting to it.

# Usage
Simply see [docker-compose.dev.yml](docker-compose.dev.yml) or [docker-compose.yml](docker-compose.yml) for examples on how to run this image.

The development image simply comes with `log_errors = On` which logs php errors in the docker logs.

Don't forget to either update `MSSQL_SA_PASSWORD` environment variable manually in the docker-compose file or copy [.env.example](.env.example) into `.env` file in the same directory and change the password their. 

## Docker Run
If you need a docker run command directly to quickly develop some project (make sure to change serverName in php accordingly) in any directory, use the following command:
```shell
docker run -p "8888:80" -v "${PWD}:/var/www/html" --platform linux/amd64 shamsmm/php-mssql-sqlsrv:dev
```

# Building
To build this image locally on your device instead of pulling it from docker hub, simply run any of the following commands:

```shell
docker build -t shamsmm/php-mssql-sqlsrv .
```

```shell
docker build -t shamsmm/php-mssql-sqlsrv:prod --build-arg MODE=prod .
```

