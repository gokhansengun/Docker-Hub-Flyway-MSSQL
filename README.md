# What is this image?

This image provides a Flyway image simplifying MSSQL usage with Flyway.

# Getting Started

There are two scenarios in which this image could be used. Docker Compose and Docker CLI. You may find example setup in `https://github.com/gokhansengun/Docker-Hub-Flyway-MSSQL/tree/master/test`.

## Docker Compose

Below steps examplify the usage of the image in the Docker Compose version 2 (Docker for Mac and Docker for Windows).

Create a `docker-compose.yml` file like below. There is only one service which is Flyway migrator. You should have your migration sql files under the `sql` directory which is placed under the same directory as `docker-compose.yml` file.

Below, the command for `flyway-migrator` is in the format of `<DB_IP_OR_NAME> <DB_PORT> <DB_USERNAME> <DB_PASSWORD> <DB_NAME>`

```docker
version: '2'

services:

  flyway-migrator:
    image: gsengun/flyway-mssql:1.0
    volumes:
      - ./sql:/flyway/sql
    command: 172.16.41.131 1433 sa 12345678 testdbname
```

Open a terminal and run the service using `docker-compose up flyway-migrator`

## Docker CLI

Below steps examplify the usage of the image in the Docker CLI.

Open a terminal and navigate to the `sql` folder containing your migration sql files. Run the command below.

```
docker run --rm -v `pwd`/sql:/flyway/sql gsengun/flyway-mssql:1.0 <DB_IP_OR_NAME> <DB_PORT> <DB_USERNAME> <DB_PASSWORD> <DB_NAME>
```

example command:

```
docker run --rm -v `pwd`/sql:/flyway/sql gsengun/flyway-mssql:1.0 172.16.41.131 1433 sa 12345678 testdbname
```


