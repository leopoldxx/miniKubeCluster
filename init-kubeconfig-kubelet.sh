export KUBE_APISERVER="https://10.0.2.15:6443"

kubectl config set-cluster kubernetes \
    --certificate-authority=certs/ca.pem \
    --embed-certs=true \
    --server=${KUBE_APISERVER} \
    --kubeconfig=conf/kubelet.kubeconfig

 kubectl config set-credentials kubelet \
    --client-certificate=certs/apiserver-client.pem \
    --client-key=certs/apiserver-client-key.pem \
    --embed-certs=true \
    --kubeconfig=conf/kubelet.kubeconfig

 kubectl config set-context default \
    --cluster=kubernetes \
    --user=kubelet \
    --kubeconfig=conf/kubelet.kubeconfig

 kubectl config use-context default --kubeconfig=conf/kubelet.kubeconfig

