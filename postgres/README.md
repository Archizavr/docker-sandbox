# PostgreSQL

> PostgreSQL is an open-source relational database management system known for reliability, ACID compliance, and strong SQL support.

This setup runs two containers:
- postgres – the database server
- adminer – a lightweight web-based database management tool

The environment can be started with:

`make postgres_start`

and stopped with:

`make postgres_stop`

This setup allows you to quickly run a PostgreSQL instance and manage it through a web UI.

## Troubleshooting

Check PostgreSQL container is running:
``` bash
docker exec -it pg_db psql --version
```

Connect to database console:
``` bash
docker exec -it pg_db psql -U admin -d school_db
```

Try execute those commands in console:
* \l - returns list of databases;
* \c school_db - connect to school_db database;
* \dt - returns list of tables;
* select * from students; - run SQL script.
* \q - leave console