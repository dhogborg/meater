FROM dhogborg/gosser

MAINTAINER David Högborg <d@hogborg.se>

RUN apt-get update && apt-get install -y ca-certificates
RUN apt-get install -yq \
	curl \
	imagemagick \
	cron

ADD getmeater /getmeater
ADD run.sh /run.sh
RUN chmod 755 /getmeater /run.sh

ADD config/ /config

CMD ["/run.sh"]