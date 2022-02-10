# 주키퍼는 myid 파일로 클러스터를 구분. 1~255까지 지정 가능 
mkdir -p /data 

echo $MY_ID > /data/myid 

# 주키퍼 서버를 실행한다. 
/opt/zookeeper/bin/zkServer.sh start

# 자동으로 종료되지 않도록 방지한다. 
tail -f /dev/null

