# SQL Optimization Mini Project

## Table of Contents

[SQL Optimization Mini Project](#sql-optimization-mini-project)
  * [Getting Started](#getting-started)
  * [Project Setup](#project-setup)
    + [1. Configure Environment Variables](#1-configure-environment-variables)
    + [2. Spin Up and Seed DB](#2-spin-up-and-seed-db)
  * [Project Teardown](#project-teardown)
  * [Questions + Solutions](#questions---solutions)
  * [References](#references)

## Getting Started

- Setup the [project](#project-setup)
- View [notion page](https://www.notion.so/bfmcneill/03-sql-optimizer-409b7a9f791646009e4dc3ecd7d1c299)

## Project Setup

### 1. Configure Environment Variables

- Create `.env` using the template from `[datebase].example.env`

```bash
# For MariaDB
cp maria.env.example .env
# For MySQL
cp mysql.env.example .env
```
 
- Open `.env` and set values for database secrets

### 2. Spin Up and Seed DB 

```bash
docker compose up -d
```

```bash
docker compose exec -it db sh /home/scripts/init.sh
```

- Look up the password for root user in `.env` file.
  

## Project Teardown

- Stop compose services and remove the volume

```bash
docker compose down -v
```

## Questions + Solutions

- All questions in their initial state are located in [sql-questions](./sql-questions/)
- All solutions are located in [sql-solutions](./sql-solutions/)


## References

- [Project link](https://www.springboard.com/workshops/data-engineering-career-track/learn#/curriculum/24148)
- [Docker compose example](https://nickjanetakis.com/blog/docker-tip-88-switching-mysql-to-mariadb-for-arm-64-m1-support)
- [Env files with docker compose](https://docs.docker.com/compose/environment-variables/)
- [MySQL's `EXPLAIN` Demystified](https://www.youtube.com/watch?v=ZoLoIFW1H6g&ab_channel=Percona)
- [DBeaver Query Execution Plan](https://dbeaver.com/docs/wiki/Query-Execution-Plan/)