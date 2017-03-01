#! /bin/bash

# ROOT CA
#cfssl gencert -initca certs/conf/config-ca.json | cfssljson -bare certs/ca

# apiserver 
# apiserver server cert/key
cfssl gencert -ca=certs/ca.pem -ca-key=certs/ca-key.pem -config=certs/conf/config-profiles.json -profile=server certs/conf/config-apiserver-server.json | cfssljson -bare certs/apiserver-server
# apiserver client cert/key
cfssl gencert -ca=certs/ca.pem -ca-key=certs/ca-key.pem -config=certs/conf/config-profiles.json -profile=client certs/conf/config-apiserver-client.json | cfssljson -bare certs/apiserver-client


# etcd
# etcd server cert/key
cfssl gencert -ca=certs/ca.pem -ca-key=certs/ca-key.pem -config=certs/conf/config-profiles.json -profile=server certs/conf/config-etcd-server.json | cfssljson -bare certs/etcd-server
# etcd client cert/key
cfssl gencert -ca=certs/ca.pem -ca-key=certs/ca-key.pem -config=certs/conf/config-profiles.json -profile=client certs/conf/config-etcd-client.json | cfssljson -bare certs/etcd-client
# etcd peer cert/key
cfssl gencert -ca=certs/ca.pem -ca-key=certs/ca-key.pem -config=certs/conf/config-profiles.json -profile=peer certs/conf/config-etcd-peer.json | cfssljson -bare certs/etcd-peer
