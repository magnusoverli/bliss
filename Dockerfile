FROM lsiobase/alpine:latest

ENV VMARGS -Dbliss_working_directory=/config

VOLUME /config /music

EXPOSE 3220 3221

RUN mkdir /bliss

RUN wget -q https://www.blisshq.com/downloads/blog/installing-bliss-qnap-docker-container/bliss-runner.sh -P /bliss

ADD bliss-runner.sh /bliss/

RUN chmod +x /bliss/bliss-runner.sh

RUN apk update
RUN apk add wget openjdk8-jre-base

RUN wget -qO- http://www.blisshq.com/app/latest-linux-version | xargs wget -O bliss-install-latest.jar -nv

RUN echo INSTALL_PATH=/bliss > auto-install.properties
RUN java -jar bliss-install-latest.jar -console -options auto-install.properties

WORKDIR /bliss

CMD /bliss/bliss-runner.sh
