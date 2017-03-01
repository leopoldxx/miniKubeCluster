#! /bin/sh
IP=$(hostname -I | awk '{print $1}')
export PATH=/home/workspace/k8s/bin:$PATH
cd $(dirname $0)

exec bin/hyperkube proxy --alsologtostderr=true \
	--v=8 \
	--bind-address=0.0.0.0 \
	--master=http://${IP}:8080 >logs/proxy.log 2>&1


