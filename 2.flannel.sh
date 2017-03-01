#! /bin/sh
IP=$(hostname -I | awk '{print $1}')
export PATH=/home/kubernetes/miniKubeCluster/bin:$PATH
cd $(dirname $0)

etcdctl --cert-file "certs/etcd-client.pem" \
    --key-file "certs/etcd-client-key.pem" \
    --ca-file "certs/ca.pem" \
    --endpoints "https://$IP:2379" \
    set /coreos.com/network/config  \
    '{ "Network": "10.128.0.0/16", "SubnetLen": 24, "SubnetMin": "10.128.1.0", "SubnetMax": "10.128.16.0", "Backend": { "Type": "vxlan" } }'

exec bin/flanneld  -etcd-cafile="certs/ca.pem" \
    -etcd-certfile="certs/etcd-client.pem" \
    -etcd-keyfile="certs/etcd-client-key.pem" \
    -etcd-endpoints="https://$IP:2379" > logs/flannel.log 2>&1

