sudo apt update && sudo apt upgrade -y
sudo swapoff -a
sudo hostnamectl set-hostname $1
echo "Installing Docker (docker.io)"
sudo apt-get update && sudo apt-get install -y docker.io
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
echo "Installing Kubernetes (kubelet kubeadm kubectl)"
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
echo "Rebooting in 5 seconds"
sleep 5s
sudo reboot