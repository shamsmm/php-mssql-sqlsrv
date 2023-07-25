# php-mssql-sqlsrv
A php container with sqlsrv and Microsoft ODBC drivers installed for development and production.
Based on [Official PHP image](https://hub.docker.com/_/php/) and [Official Microsoft ODBC driver for SQL Server (Linux) Tutorial](https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server).

This repository also includes example on running the MSSQL server and connecting to it.

| ℹ️ Note                                                                                                                                                                   | 
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The container tag is `shamsmm/php-mssql-sqlsrv` or `shamsmm/php-mssql-sqlsrv:prod` and docker hub page is [here](https://hub.docker.com/r/shamsmm/php-mssql-sqlsrv/tags). |


# Usage
Simply see [docker-compose.yml](docker-compose.yml) or [docker-compose.prod.yml](docker-compose.prod.yml) for examples on how to run this image.

The development image sets `log_errors = On` in `php.ini` which logs php errors in the docker logs.

Don't forget to either update `MSSQL_SA_PASSWORD` environment variable manually in the docker-compose file or copy [.env.example](.env.example) into `.env` file in the same directory and change the password their. 

| ⚠️ Warning                                                                                                                                | 
|-------------------------------------------------------------------------------------------------------------------------------------------|
| The default docker-compose file and default image is for development uses, PHP errors and warnings will be output to docker logs.         |


## Docker Run
If you need a docker run command directly to quickly develop some project (make sure to change serverName in php accordingly) in any directory, use the following command:
```shell
docker run -p "8888:80" -v "${PWD}:/var/www/html" --platform linux/amd64 shamsmm/php-mssql-sqlsrv
```

| ✅ Easy Development                                                                                                                                     | 
|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| This is almost one-to-one to running `php -S localhost:8888` with the added bonus that all the drivers and modules are installed in a docker container |

# Building
To build this image locally on your device instead of pulling it from docker hub, simply run any of the following commands:

```shell
docker build -t shamsmm/php-mssql-sqlsrv .
```

```shell
docker build -t shamsmm/php-mssql-sqlsrv:prod --build-arg MODE=prod .
```
