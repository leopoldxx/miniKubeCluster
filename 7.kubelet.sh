#! /bin/sh
IP=$(hostname -I | awk '{print $1}')
export PATH=/home/kubernetes/miniKubeCluster/bin:$PATH
cd $(dirname $0)

exec bin/hyperkube kubelet --alsologtostderr=true \
	--v=3 \
	--address=0.0.0.0 \
	--port=10250 \
    --docker-endpoint="tcp://0.0.0.0:2376" \
    --require-kubeconfig \
    --cert-dir=certs/kubelet/ \
    --kubeconfig=conf/kubelet.kubeconfig \
    >logs/kubelet.log 2>&1

