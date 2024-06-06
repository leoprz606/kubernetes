
# https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal
https://www.ibm.com/blog/kubernetes-ingress/#:%7E:text=is%20it%20useful%3F-,Kubernetes%20Ingress%20is%20an%20API%20object%20that%20provides%20routing%20rules,%2C%20typically%20via%20HTTPS%2FHTTP.&text=Ingress%20allows%20you%20to%20configure,object%20and%20the%20Ingress%20Controller.


helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespacehe

kubectl get pods --namespace=ingress-nginx


kubectl create ingress awx-localhost --class=nginx \
  --rule="helm.sh/chart=awx-operator:80"

kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
