# =============================================================================
# goubb/centos-squid-ssh
#
# CentOS-7 7.3.1611 x86_64 - Squid / OpenSSH.
# 
# =============================================================================
FROM centos:7.3.1611

MAINTAINER GouBB <goubaoaob.docker@gmail.com>

# -----------------------------------------------------------------------------

RUN rpm --rebuilddb >> /var/log/yumintlog
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 >> /var/log/yumintlog
RUN yum clean all >> /var/log/yumintlog
RUN yum -y install \
		passwd \
		openssh \
		openssh-server \
		openssh-client \
		openssl \
		squid  >> /var/log/yumintlog
RUN yum clean all >> /var/log/yumintlog

# -----------------------------------------------------------------------------

RUN echo 'pgA0sSw0bBrD' | passwd --stdin root >> /var/log/yumintlog

RUN /etc/init.d/sshd start >> /var/log/yumintlog

#RUN service squid start >> /var/log/yumintlog

EXPOSE 22
EXPOSE 3128

