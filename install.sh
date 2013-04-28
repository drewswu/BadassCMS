#!/bin/bash
# This is a server setup script for ${amazon_server} on the Amazon CentOS 6.3 minimal r2 image
set -x

DEBUG=true
amazon_server=ec2-54-224-12-98.compute-1.amazonaws.com
git_version=1.8.2
node_version=v0.10.3
arch=x86_64
git_dir=/data/git
blog_dir=${git_dir}/myblog.git

function die() {
  echo "Error: ${1}";
  exit 1;
}

function route_firewall() {
  sudo service iptables stop
  sudo iptables -X
#  sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j     REDIRECT --to-ports 8080
}

function install_admin_pkgs() {
  sudo yum install -y htop.${arch} monit.${arch} lynx.${arch} telnet.${arch}
  sudo yum install -y mlocate.${arch} && sudo updatedb &
  sudo echo 'PATH=$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin' >> /root/.bashrc
  sudo echo 'export PATH' >> /root/.bashrc
  echo 'PATH=$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin' >> ~/.bashrc
  echo 'export PATH' >> ~/.bashrc
}

function install_devel_pkgs() {
  sudo yum install -y curl-devel.${arch} expat-devel.${arch} gettext-devel.${arch} openssl-devel.${arch} zlib-devel.${arch} gcc.${arch} mak
e.${arch} glibc.${arch} perl-ExtUtils-MakeMaker.${arch} gcc-c++.${arch} compat-gcc-32.${arch} compat-gcc-32-c++.${arch}
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
  sudo /usr/local/bin/npm install -g wheat proto git-fs step haml datetime simple-mime stack creationix
}

# Setup blog git repo
function setup_blog() {
  sudo mkdir -p ${blog_dir} && sudo chown -R ec2-user:ec2-user ${git_dir}
  mkdir ${blog_dir}/authors ${blog_dir}/articles ${blog_dir}/skin
  cp -R authors ${blog_dir}
  cp -R articles ${blog_dir}
  cp -R skin ${blog_dir}
  cp src/server/server.js ${blog_dir}/blog.js
  cp description.markdown ${blog_dir}
  /usr/local/bin/git init
  /usr/local/bin/git add *
  /usr/local/bin/git commit -am "initial commit"
  cp -R ${blog_dir} ~/myblog
}

function start_node() {
  /usr/local/bin/node src/server/blog.js &
}

# ===== MAIN =====
route_firewall
if [ "$DEBUG" == "false" ]; then
install_admin_pkgs
install_devel_pkgs
install_git
install_node
install_node_pkgs
fi
setup_blog
start_node
