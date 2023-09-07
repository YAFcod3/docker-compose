PGPASSWORD=PwdDev mysql -h localhost -U dev -d pgdata -f ./deletepgsqlschema.sql

for file in ./pgsql/model/*
do
    PGPASSWORD=PwdDev psql -h localhost -U dev -d pgdata -f "$file" 
done

# for file in ./pgsql/data/*
# do
#   PGPASSWORD=PwdDev psql -h localhost -U dev -d pgdata-data -f "$file" 
# done
