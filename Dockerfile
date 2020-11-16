# set base OS image
FROM centos:centos8

# install package
RUN yum update -y 
RUN yum install -y epel-release passwd httpd git python2 httpd which 
RUN pip2 install django==1.11.29

# settings
RUN useradd admin
RUN usermod -aG wheel admin
RUN systemctl enable httpd

# locale
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial && \
    yum install -y glibc-locale-source && \
    localedef -f UTF-8 -i en_US en_US.UTF-8 && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    TZ="Asia/Tokyo"
