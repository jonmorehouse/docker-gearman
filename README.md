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
docker run -d -p 5432:5432 -e USER=gearman -e PASS=gearman -e DB=gearman -name psql paintedfox/postgresql

# create gearman database
# create password file 
psql -H 127.0.0.1 -p 5432 -U gearman --password

# run gearman linked to the psql environment 
docker run -d -link psql:psql -e TYPE=postgres -e LINK=PSQL -name gearman jonmorehouse/gearman 

# run a plain gearman installation
docker run -d -name gearman jonmorehouse/gearman

# check gearman is running normally
gearadmin -p 4730
```



