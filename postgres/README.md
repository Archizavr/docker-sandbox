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