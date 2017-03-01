#! /bin/sh
IP=$(hostname -I | awk '{print $1}')
export PATH=/home/kubernetes/miniKubeCluster/bin:$PATH
cd $(dirname $0)

mkdir -p logs

exec bin/etcd  --listen-peer-urls "http://$IP:2380"  \
    --listen-client-urls "https://$IP:2379" \
    --cert-file "certs/etcd-server.pem" \
    --key-file "certs/etcd-server-key.pem" \
    --trusted-ca-file "certs/ca.pem" \
    --client-cert-auth \
    --advertise-client-urls "https://$IP:2379" \
    --data-dir "/home/kubernetes/miniKubeCluster/data/etcd/" >logs/etcd.log 2>&1
