# =============================================================================
# goubb/centos-squid-ssh
#
# CentOS-7 7.3.1611 x86_64 - Squid / OpenSSH.
# 
# =============================================================================
FROM centos:7.3.1611

MAINTAINER GouBB <goubaoaob.docker@gmail.com>

# -----------------------------------------------------------------------------

RUN rpm --rebuilddb \
	&& rpm --import \
		http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 \
	&& yum cleal all \
	&& yum -y install \
		passwd \
		openssh \
		openssh-server \
		openssh-client \
		openssl \
		squid \
	&& yum clean all

# -----------------------------------------------------------------------------

RUN echo 'pAsSw0rD' | passwd root 

RUN service sshd start

EXPOSE 22
EXPOSE 3128

