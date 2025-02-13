
# INTIAL SSH SETUP
sed -i 's/#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config
systemctl restart sshd

# REMOTE WORKER NODE PRE ANSIBLE SETUP
useradd k8s
mkdir -m 400 /home/k8s/.ssh
chmod 755 /home/k8s
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCPDIvdriJ6SzP+F0v6xbvrfn1UmAqYS0j8E6EhYO847jOmNJa48afOiYonoH3Jnm/JVGkCepEmhIuMZmCLLfRlPFTRCv5n1WzTW1Zk9/zKqk/BNkeHS6bcG4x7Pr6QqxojWtgreMcMUGbS4ix7EqOimogN5VaQcntv8L/jh0RT0M6eNqiTB1OhvM9fiWIu9dYmz/Noe1OoEAbKn9suoQDEylWMsPRVpl/eM0JytcKuZ05ikcVLFgbYuFDWwdLp+DYIWuoNSahyDpufs770ZyrO99KuCvcLGbNv8PiCSyi59GIFmI2dG8tvmPMAJDU1XiWlyymJvswXdVoDcNokzLaF root@localhost.localdomain
' >> /home/k8s/.ssh/authorized_keys
chown -R k8s /home/k8s/.ssh
chmod 600 /home/k8s/.ssh/authorized_keys
chmod 700 /home/k8s/.ssh
sed -i 's/#AllowTcpForwarding/AllowTcpForwarding/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication/#PasswordAuthentication/g' /etc/ssh/sshd_config
#sed -i 's/# %wheel        ALL=(ALL)       NOPASSWD: ALL/%wheel        ALL=(ALL)       NOPASSWD: ALL/g' /etc/sudoers
echo 'k8s     ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
systemctl restart sshd
# LOCAL CONTROLLER PRE ANSIBLE SETUP
yum update -y
yum install telnet -y
yum install pip -y
pip install ansible

echo 'alias k=kubectl' >> /root/.bash_profile
echo 'cd /home/k8s/repositories' >> /root/.bash_profile
echo 'export KUBECONFIG=/etc/kubernetes/admin.conf' >> /root/.bash_profile
