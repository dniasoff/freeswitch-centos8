FROM centos:centos8


RUN dnf install http://repo.okay.com.mx/centos/8/x86_64/release/okay-release-1-3.el8.noarch.rpm -y
RUN dnf install epel-release -y
RUN dnf update -y
RUN dnf install -y freeswitch freeswitch-codec* freeswitch-lang* freeswitch-application* freeswitch-sounds-* gdb sngrep --exclude=freeswitch-application-mongo --exclude=freeswitch-debug

RUN dnf install -y freeswitch-application-mongo
ENTRYPOINT ["/run.sh"]
CMD ["/usr/bin/freeswitch", "-nonat", "-nf", "-nc"]
