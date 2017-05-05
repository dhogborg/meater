FROM debian

MAINTAINER David Högborg <d@hogborg.se>

RUN apt-get update && apt-get install -y ca-certificates
RUN apt-get install -yq \
	curl \
	imagemagick \
	cron

# install gosser and atnetgo
RUN apt-get install -yq unzip
RUN curl -L https://github.com/dhogborg/gosser/releases/download/v0.0.2/gosser_linux64.zip -O ; \
	unzip gosser_linux64.zip ; cp build/gosser /usr/bin
RUN curl -L https://github.com/dhogborg/atnetgo/releases/download/v0.0.4/atnetgo_linux64.zip -O ; \
	unzip atnetgo_linux64.zip ; cp build/atnetgo /usr/bin/

ADD getmeater /getmeater
ADD run.sh /run.sh
RUN chmod 755 /getmeater /run.sh

ADD config/ /config

CMD ["/run.sh"]