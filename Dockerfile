FROM densuke/ubuntu-jp-remix:trusty

ENV DEBIAN_FRONTEND noninteractive
#RUN apt-get update -y
RUN apt-get install -y wget
RUN wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
RUN wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
RUN wget https://www.ubuntulinux.jp/sources.list.d/trusty.list -O /etc/apt/sources.list.d/ubuntu-ja.list
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y openssh-server xterm xauth x11-xserver-utils openjdk-7-jdk unzip
RUN ln -s /bin/dbus-daemon /usr/bin
## eclipse
WORKDIR /opt
#RUN wget -q -O - http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/neon/M2/eclipse-jee-neon-M2-linux-gtk-x86_64.tar.gz | tar -zxf -
RUN wget -q -O - http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz | tar -zxf -
RUN wget -q -O /tmp/pleiades.zip 'http://osdn.jp/frs/redir.php?m=jaist&f=%2Fmergedoc%2F63462%2Fpleiades_1.6.0.zip'
RUN ln -s /opt/eclipse/eclipse /usr/local/bin
#WORKDIR /opt/eclipse
#RUN unzip /tmp/pleiades.zip
#RUN echo '-javaagent:/opt/eclipse/plugins/jp.sourceforge.mergedoc.pleiades/pleiades.jar' >> /opt/eclipse/eclipse.ini
#
ADD run.sh /etc/
RUN chmod +x /etc/run.sh
EXPOSE 22
CMD /etc/run.sh
