#! /bin/bash

# This Script basically take the 3 inputs from user in commandline .
# startdate, enddate paramets should be in YYYYMMDD format. This is basically used for Hive external Tables with partiton like years,months,days
# also enter referencenumber of your choice

read -p "Please enter start date    : " VAL1
read -p "Please enter end date     : " VAL2
read -p "Please enter the referencenumber : " VAL3

echo "You have enteered  $VAL1 as startdate  $VAL2 as enddate and $VAL3 as referencenumber for this query"

echo "Now SIT-BACK  enjoy the output"

hive hive -e "use yourdatabase_name; select * from table_name where startdate=$VAL1 and enddate=$VAL2 and referencenumber=$VAL3 >/home/kapru/output_$VAl1_$VAL2_$VAL3.tsv

echo "Finished!!!!"
