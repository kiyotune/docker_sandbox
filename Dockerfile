# set base OS image
FROM centos:centos8

# install package
RUN yum update -y 
RUN yum install -y epel-release passwd httpd git python2 httpd

# settings
RUN useradd admin
RUN usermod -aG wheel admin
RUN passwd --expire admin
RUN systemctl enable httpd
