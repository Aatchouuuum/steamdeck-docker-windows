#ENABLE SSH ONCE
#sudo systemctl start sshd

# ENABLE USE OF PACMAN
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux

#ENABLE ALL SOURCES
echo '[options]' | sudo tee -a /etc/pacman.conf
echo 'SigLevel = TrustAll' | sudo tee -a /etc/pacman.conf

#INSTALL DOCKER
sudo pacman -Syy docker
sudo systemctl start docker.service
sudo systemctl enable docker.service

#INSTALL DOCKER-COMPOSE
sudo pacman -S docker-compose

#INSTALL REMMINA
flatpak install flathub org.remmina.Remmina

#INSTALL REMMINA
flatpak install flathub io.gitlab.librewolf-community

#ADD DOCKER CONFIG
sudo usermod -aG docker $USER
sudo gpasswd -a $USER docker
#newgrp docker

#Start image
docker-compose up -d

#lunch in browser
flatpak run io.gitlab.librewolf-community "localhost:8006"