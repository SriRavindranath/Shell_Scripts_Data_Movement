#! /bin/bash

# This command prints the size of the file in hadoop environment.
echo "Startd!!!"

hdfs fsck /apps/hive/warehouse -files | grep "/apps/hive/warehouse" | grep -v "<dir>" | gawk '{print $2, $1;}'  | sort -n

echo "Finished!!!!"
