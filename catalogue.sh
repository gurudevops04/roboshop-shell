source import_func.sh
component=catalogue
Nodejs

dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.gurudevops4.online </app/db/master-data.js