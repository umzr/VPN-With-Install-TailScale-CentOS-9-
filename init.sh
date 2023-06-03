echo 'Install TailScale (CentOS 9) 4/06/2023'
sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/centos/9/tailscale.repo
sudo dnf install tailscale
sudo systemctl enable --now tailscaled
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
sudo tailscale up --advertise-exit-node --accept-routes --reset