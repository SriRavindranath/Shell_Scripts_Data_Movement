#! /bin/bash
#Author ="SRavindranath"
echo "Started!!!"
if
hadoop fs -test -d /DQData/Actions ;
then
hadoop fs -rm -r /DQData/Actions
fi
sqoop import --connect "jdbc:sqlserver://sqlserver_name:1433;database=mydatabasename;username=user_name;password=your_password" --query 'SELECT TOP 100 id,description FROM table_name where id<3 AND $CONDITIONS' -m 1 --null-string '\\N' --null-non-string '\\N' --hive-drop-import-delims --target-dir "/complete_path_name/Actions" 2>&1 | tee /home/brillio/DQ/DQLogs/Actions.txt
if [ ! -d "/home/username/complete_path_name/DQData/Actions" ]; then
  sudo mkdir /home/username/complete_path_name/DQData/Actions
fi
if [ -f "/home/username/complete_path_name/DQData/Actions/part-m-00000" ]; then
  sudo rm /home/username/complete_path_name/DQData/Actions/part-m-00000
fi
sudo chmod -R 777 /home/username/complete_path_name/complete_path_name/DQData/Actions
hadoop fs -copyToLocal /localpath/Actions/part-m-00000 /home/username/complete_path_name/DQ/DQData/Actions/
echo "Finished!!!!"
