FROM efrecon/rsshd
MAINTAINER Robert Shaw <robbynshaw@gmail.com>

RUN apk add --update\
    weechat\
    weechat-python\
    weechat-perl\
    python\
    bash\
    ncurses\
    screen\
    mosh-server\
    && rm -rf /var/cache/apk/*

ENV LANG C.UTF-8
ENV HOME /weechat

#Create user to run screen/weechat
RUN mkdir -p $HOME/.weechat\
    && addgroup weechat\
    && adduser -h $HOME -D -s /bin/bash -G weechat weechat\
    && chown -R weechat:weechat $HOME

#Add support for termite
COPY termite.terminfo termite.terminfo
RUN tic -x termite.terminfo

#Expose for persistance
VOLUME /weechat/.weechat

COPY startup.sh /usr/local/bin/

#      chat mosh
EXPOSE 9001 60001/udp

WORKDIR $HOME

ENTRYPOINT /usr/local/bin/startup.sh
