Gearman
=======

Usage
-----

```
# dockerfile
FROM jonmorehouse/gearman

```


```
# POSTGRESQL USAGE
# start a postgresql instance 
docker run -d -p 5432:5432 -e USER=gearman -e PASS=gearman -e DB=gearman -name psql jonmorehouse/postgresql

# run gearman and link with psql
docker run -d -link psql:psql -e QUEUE=postgres -name gearman jonmorehouse/gearman 

# run a plain gearman installation
docker run -d -name gearman jonmorehouse/gearman

# check gearman is running normally
gearadmin -p 4730
```



