#! /bin/sh

echo "> 현재 구동중인 애플리케이션 pid 확인"

REPOSITORY=/home/ec2-user/build
CURRENT_PID=$(pgrep -f tomcat)
ROOT_WAR=$(ls -a $REPOSITORY | grep ROOT.war)
DEPLOY_PID=$(pgrep -f deploy.sh)

echo "$CURRENT_PID"

if [ -z $CURRENT_PID ]; then
    echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
    echo "> kill -2 $CURRENT_PID"
    kill -9 $CURRENT_PID
    sleep 5
fi

echo "> 새 어플리케이션 배포 및 실행"

if [ -z $ROOT_WAR ]; then
        echo "war 파일이 존재하지 않습니다."
        kill -9 $DEPLOY_PID
else
        sudo mv $REPOSITORY/ROOT.war /usr/local/tomcat/webapps/
    sleep 5
        sudo /usr/local/tomcat/bin/catalina.sh start
fi

