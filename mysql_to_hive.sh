#! /bin/bash

# Script to get data from mysql table by day wise and push them into hadoop-hive's external table.

echo "Started!!!"
#enter the details of mysql db
user="root"
password="root"
host="localhost"
database="db_name"
query="select * from table_name where DATE(datetime_column)='2017-01-01'"

#now executing the command to get the data from mysql into flatfile.
echo "Now querying Mysql Db to fecth the data and save it in Flatfile"
mysql -u$user -D$database -h$host -p$password -e"$query" >/home/user/output.tsv
