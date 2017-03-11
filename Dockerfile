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
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' >> /var/log/yumintlog
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' >> /var/log/yumintlog
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N '' >> /var/log/yumintlog 
#RUN /usr/sbin/sshd >> /var/log/yumintlog

RUN cat /var/log/yumintlog

RUN mkdir /var/run/sshd

EXPOSE 22
EXPOSE 3128

CMD ["/usr/sbin/sshd", "-D"]
