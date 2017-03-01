#! /bin/sh
IP=$(hostname -I | awk '{print $1}')
export PATH=/home/kubernetes/miniKubeCluster/bin:$PATH
cd $(dirname $0)

exec bin/hyperkube scheduler --alsologtostderr=true \
	--v=3 \
	--master=http://127.0.0.1:8081 \
	--port=10251 > logs/scheduler.log 2>&1

