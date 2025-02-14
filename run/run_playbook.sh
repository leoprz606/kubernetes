export ANSIBLE_BECOME=true

#controller create
ansible_become=true ansible-playbook \
../ansible/centos9/kubernetes/install_kubernetes_controller.yml \
-b -e "cluster_state=create"

#controller reset
ansible_become=true ansible-playbook \
../ansible/centos9/kubernetes/install_kubernetes_controller.yml \
-b -e "cluster_state=reset"


# worker reset, join
ansible_become=true ansible-playbook \
../ansible/kubernetes/install_kubernetes_worker.yml \
-b -e "worker_state=join worker_hostname=awx-k8-prod-02.aws-use1.cloud.marriott.com controller_hostname=awx-k8-prod-01.aws-use1.cloud.marriott.com" \
-i inventory


