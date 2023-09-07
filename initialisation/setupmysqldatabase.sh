mysql -h127.0.0.1 -P 4704 -udev --password=PwdDev -D mydata < ./deletemysqlschema.sql

for file in ./mysql/model/*
do
    mysql -h127.0.0.1 -P 4704 -udev --password=PwdDev -D mydata < "$file" 
done

for file in ./mysql/data/*
do
    mysql -h127.0.0.1 -P 4704 --local-infile=1 -udev --password=PwdDev -D mydata < "$file" 
done
