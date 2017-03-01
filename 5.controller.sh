#! /bin/sh
IP=$(hostname -I | awk '{print $1}')
export PATH=/home/kubernetes/miniKubeCluster/bin:$PATH
cd $(dirname $0)

exec bin/hyperkube controller-manager --logtostderr=true  \
	--v=3 \
	--master=http://127.0.0.1:8081 \
    --cluster-signing-cert-file="certs/ca.pem" \
    --cluster-signing-key-file="certs/ca-key.pem" \
	--port=10252 > logs/controller.log 2>&1

