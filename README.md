# SQL Optimization Mini Project

[https://github.com/bfmcneill/sql-optimization-mini-project](https://github.com/bfmcneill/sql-optimization-mini-project)

## spin up maria db instance

- create `.env` using the template from `.env.example`

```bash
cp .env.example .env
```

- seed the database 
  1. spin up docker compose 
  2. exec into database container 
  3. run init script

```bash
docker compose up -d
```

```bash
docker compose exec -it db /bin/bash
```

```bash
sh /home/scripts/init.sh
```

## Questions + Solutions

- all questions in their initial state are located in[sql-questions](./sql-questions/)
- all solutions are located in [sql-solutions](./sql-solutions/)


## references



* [project link](https://www.springboard.com/workshops/data-engineering-career-track/learn#/curriculum/24148)
* [docker compose example](https://nickjanetakis.com/blog/docker-tip-88-switching-mysql-to-mariadb-for-arm-64-m1-support)
* [env files with docker compose](https://docs.docker.com/compose/environment-variables/)
