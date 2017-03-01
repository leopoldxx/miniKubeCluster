export KUBE_APISERVER="https://10.0.2.15:6443"

kubectl config set-cluster kubernetes \
    --certificate-authority=certs/ca.pem \
    --embed-certs=true \
    --server=${KUBE_APISERVER} \
    --kubeconfig=conf/kubectl.kubeconfig

 kubectl config set-credentials kubectl \
     --client-certificate=certs/apiserver-client.pem \
     --client-key=certs/apiserver-client-key.pem \
    --embed-certs=true \
    --kubeconfig=conf/kubectl.kubeconfig

 kubectl config set-context default \
    --cluster=kubernetes \
    --user=kubectl \
    --kubeconfig=conf/kubectl.kubeconfig

 kubectl config use-context default --kubeconfig=conf/kubectl.kubeconfig

