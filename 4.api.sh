#! /bin/sh
IP=$(hostname -I | awk '{print $1}')
export PATH=/home/kubernetes/miniKubeCluster/bin:$PATH
cd $(dirname $0)

exec bin/hyperkube apiserver --logtostderr=true  \
	--v=3 \
    --etcd-servers=https://$IP:2379 \
    --etcd-cafile=certs/ca.pem \
    --etcd-certfile=certs/etcd-client.pem \
    --etcd-keyfile=certs/etcd-client-key.pem \
	--insecure-bind-address=127.0.0.1 \
	--insecure-port=8081 \
    --bind-address=${IP} \
	--advertise-address=${IP} \
    --tls-cert-file=certs/apiserver-server.pem \
    --tls-private-key-file=certs/apiserver-server-key.pem \
    --kubelet-https=true \
    --token-auth-file=conf/auth_token.conf \
    --client-ca-file=certs/ca.pem \
    --service-account-key-file=certs/ca-key.pem \
    --enable-swagger-ui=true \
	--allow-privileged=false \
	--service-cluster-ip-range=172.16.0.0/16 \
    --authorization-mode=RBAC  \
    --admission-control=NamespaceLifecycle,LimitRanger,PersistentVolumeLabel,DefaultStorageClass,ResourceQuota > logs/apiserver.log 2>&1

    #--client-ca-file= \
    #--tls-private-key-file= \
    #--kubelet-client-certificate= \
    #--kubelet-client-key= \
