## Starting with docker run
#

FROM ubuntu:20.04
MAINTAINER Paul Coiner


#
# First install software packages for rtl_433 and to publish MQTT events
#
RUN apt-get update && apt-get install -y \
    wget \
    gnupg2

RUN wget -qO - http://weewx.com/keys.html | apt-key add - \
    && wget -qO - http://weewx.com/apt/weewx.list | tee /etc/apt/sources.list.d/weewx.list

RUN apt-get update && apt-get install -y -qq \
    weewx \
    && apt-get clean 


RUN cp -rp /etc/weewx /etc/.weewx.example
RUN cp -rp /usr/share/weewx/user /usr/share/weewx/.user.example
COPY start.sh /scripts/start.sh
RUN chmod +x /scripts/start.sh

#
# When running a container this script will be executed
#

CMD ["/scripts/start.sh"]

