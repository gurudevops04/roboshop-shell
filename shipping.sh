source import_func.sh
component=shipping
Maven


dnf install mysql -y 
mysql -h mysql-dev.gurudevops4.online -uroot -p$1 < /app/db/schema.sql
mysql -h mysql-dev.gurudevops4.online -uroot -p$1 < /app/db/app-user.sql
mysql -h mysql-dev.gurudevops4.online -uroot -p$1 < /app/db/master-data.sql

