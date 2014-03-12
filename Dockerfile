FROM jonmorehouse/ubuntu
MAINTAINER Jon Morehouse <morehousej09@gmail.com>

# install libraries needed for various gearman backends
RUN apt-get -y install libpq5 \ 
	libpq-dev \
 	autoconf \ 
 	bison \ 
 	flex \ 
 	libtool \ 
 	libboost-all-dev \ 
 	libcurl4-openssl-dev \
 	libevent-dev \
 	memcached \ 
 	uuid-dev \ 
 	libsqlite3-dev \ 
 	libmysqlclient-dev \
 	libcloog-ppl0 gperf \
 	wget 

# install gearman
RUN wget https://launchpad.net/gearmand/1.2/1.1.11/+download/gearmand-1.1.11.tar.gz 
RUN tar -xzvf gearmand-1.1.11.tar.gz
RUN cd gearmand-1.1.11 && ./configure && make && sudo make install
RUN rm -rf gearmand-1.1.11*
RUN sudo ldconfig

# set some defaults
ENV USER gearman
ENV PASS gearman
ENV DB gearman
# note - psql container shouldn't necessarily know these
ENV PSQL_PORT 5432
ENV PSQL_HOST 127.0.0.1

# initialize boot script
ADD bootstrap.sh bootstrap.sh
RUN chmod +x bootstrap.sh

ENTRYPOINT ["bootstrap.sh"]


