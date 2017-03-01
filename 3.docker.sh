#! /bin/sh
export PATH=/home/kubernetes/miniKubeCluster/bin/docker:$PATH
cd $(dirname $0)
#source /run/flannel/subnet.env
exec dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2376 --bip=10.128.10.1/24 --mtu=1450 >logs/docker.log  2>&1 
