FROM --platform=linux/amd64 php:8.1-apache
RUN apt-get update && apt-get install -y --no-install-recommends \
    unixodbc-dev \
    gnupg
RUN pecl install sqlsrv
RUN pecl install pdo_sqlsrv
RUN echo "extension=sqlsrv.so" >> /usr/local/etc/php/php.ini
RUN echo "extension=pdo_sqlsrv.so" >> /usr/local/etc/php/php.ini
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
ARG MODE=dev
RUN if [ "$MODE" = "dev" ] ; then echo "log_errors = On" >> /usr/local/etc/php/php.ini ; fi
EXPOSE 80