#!/bin/bash
# This is a server setup script for ${amazon_server} on the Amazon CentOS 6.3 minimal r2 image
set -x

amazon_server=ec2-54-224-12-98.compute-1.amazonaws.com
git_version=1.8.2
node_version=v0.10.3
arch=x86_64
DEBUG=true
git_dir=/data/git
blog_dir=${git_dir}/blog

function die() {
  echo "Error: ${1}";
  exit 1;
}

function install_admin_pkgs() {
  sudo yum install -y htop.${arch}
  sudo yum install -y mlocate.${arch} && sudo updatedb &
  sudo echo 'PATH=$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin' >> /root/.bashrc
  sudo echo 'export PATH' >> /root/.bashrc
}

function install_devel_pkgs() {
  sudo yum install -y curl-devel.${arch} expat-devel.${arch} gettext-devel.${arch} openssl-devel.${arch} zlib-devel.${arch} gcc.${arch} make.${arch} glibc.${arch} perl-ExtUtils-MakeMaker.${arch} gcc-c++.${arch} compat-gcc-32.${arch} compat-gcc-32-c++.${arch}
}

function install_git() {
  cd /usr/local/src
  sudo wget http://git-core.googlecode.com/files/git-${git_version}.tar.gz || die "No git version ${git_version} found. Aborting."
  sudo tar -xvzf git-${git_version}.tar.gz
  pushd git-${git_version}
  sudo ./configure
  sudo make
  sudo make install
  popd
  sudo rm git-${git_version}*.tar.gz*
}

# Install Node and npm
function install_node() {
  sudo /usr/local/bin/git clone https://github.com/joyent/node.git /usr/local/src/node.js
  pushd /usr/local/src/node.js
  sudo /usr/local/bin/git checkout ${node_version}
  sudo ./configure
  sudo make
  sudo make install
}

# Install Wheat
function install_node_pkgs() {
  sudo /usr/local/bin/npm install -g wheat
}

# ===== MAIN =====
if [ "$DEBUG" == "false" ]; then # start DEBUG segment
install_admin_pkgs
install_devel_pkgs
install_git
install_node
install_node_pkgs
fi # close DEBUG segment

# Setup blog repo directory
sudo mkdir -p ${blog_dir}
sudo /usr/local/bin/git init ${blog_dir}
# Setup node to serve git repo traffic via smart HTTPS

# Install MySQL
