Systemd() {
    systemctl daemon-reload
    systemctl enable ${component} 
    systemctl start ${component}
}

Nodejs() {
    dnf module disable nodejs -y
    dnf module enable nodejs:20 -y
    dnf install nodejs -y
    
    rm -rf /app
    cp ${component}.service /etc/systemd/system/${component}.service
    
    useradd roboshop
    mkdir /app 
    curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip
    cd /app 
    unzip /tmp/${component}.zip
    cd /app 
    npm install 

    Systemd
}

Python() {
    dnf install python3 gcc python3-devel -y
    rm -rf /app 
    cp ${component}.service /etc/systemd/system/${component}.service

    useradd roboshop
    mkdir /app 
    curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip 
    cd /app 
    unzip /tmp/${component}.zip
    cd /app 
    pip3 install -r requirements.txt

    Systemd
}

Maven() {
    dnf install maven -y
    cp ${component}.service /etc/systemd/system/${component}.service
    rm -rf /app
    useradd roboshop
    mkdir /app 
    curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip 
    cd /app 
    unzip /tmp/${component}.zip
    cd /app 
    mvn clean package 
    mv target/${component}-1.0.jar ${component}.jar 

    Systemd
}
