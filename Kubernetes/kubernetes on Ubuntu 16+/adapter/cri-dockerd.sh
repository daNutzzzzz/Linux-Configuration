echo "Congratulations on successfull Docker Engine installation."
echo "Now, Lets move on to install cri-dockerd adapter which integrates Docker with Kubenetes."
echo -e "\n"

echo "To do so, cri-dockerd has a dependency on go interpreter, since its built on it. Installing go binary now...."
echo -e "\n"

GO_VERSION=1.18.4

echo "Downloading source code"
wget -O /tmp/go$GO_VERSION.linux-amd64.tar.gz https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz

echo "Installing binary"
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/go$GO_VERSION.linux-amd64.tar.gz

echo "Exporting binary to the PATH variable"
export PATH=$PATH:/usr/local/go/bin

echo -e "\n"

echo "Verifying GO installation"
go version

if [ $? -eq 0 ]
then
    echo "******Go Installed successfully******"
else
    echo "Installation failed"
fi

echo -e "\n"

echo "***************Installing CRI-DOCKERD adapter******************"
echo -e "\n"

echo "# This adapter provides a shim for Docker Engine that lets you control Docker via the Kubernetes Container Runtime Interface. #"
echo -e "\n"
echo "Cloning repository"
git -C /tmp clone https://github.com/Mirantis/cri-dockerd.git

cd /tmp/cri-dockerd
mkdir -p bin
VERSION=$((git describe --abbrev=0 --tags | sed -e 's/v//') || echo $(cat VERSION)-$(git log -1 --pretty='%h')) PRERELEASE=$(grep -q dev <<< "${VERSION}" && echo "pre" || echo "") REVISION=$(git log -1 --pretty='%h')
go get && go build \
                -ldflags="-X github.com/Mirantis/cri-dockerd/version.Version='$VERSION}' -X github.com/Mirantis/cri-dockerd/version.PreRelease='$PRERELEASE' -X github.com/Mirantis/cri-dockerd/version.BuildTime='$BUILD_DATE' -X github.com/Mirantis/cri-dockerd/version.GitCommit='$REVISION'" \
                -o cri-dockerd

# Run these commands as root
###Install GO###
cd /tmp
wget https://storage.googleapis.com/golang/getgo/installer_linux
sudo chmod +x ./installer_linux
sudo ./installer_linux
source /root/.bash_profile

cd /tmp/cri-dockerd
go get && go build -o bin/cri-dockerd
sudo mkdir -p /usr/local/bin
sudo install -o root -g root -m 0755 bin/cri-dockerd /usr/local/bin/cri-dockerd
sudo cp -a packaging/systemd/* /etc/systemd/system
sudo sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
sudo systemctl daemon-reload
sudo systemctl enable cri-docker.service
sudo systemctl enable --now cri-docker.socket


echo "#############################################################"
echo "# References:                                               #"
echo "# https://github.com/Mirantis/cri-dockerd                   #"
echo "# https://go.dev/doc/install                                #"
echo "#############################################################"