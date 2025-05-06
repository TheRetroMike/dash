FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/dashpay/dash/releases/download/v22.1.2/dashcore-22.1.2-x86_64-linux-gnu.tar.gz
RUN tar zxvf dashcore-22.1.2-x86_64-linux-gnu.tar.gz
RUN mv dashcore-22.1.2/bin/* /usr/bin/
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/dashd -printtoconsole
