FROM jonmorehouse/ubuntu
MAINTAINER Jon Morehouse <morehousej09@gmail.com>

# install libraries needed for various gearman backends
RUN apt-get -y install libpg5 \ 
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
 	libcloog-ppl0 gperf

# install gearman
RUN curl https://launchpad.net/gearmand/1.2/1.1.11/+download/gearmand-1.1.11.tar.gz > gearmand-1.1.11.tar.gz
RUN tar -xzvf gearmand-1.1.11.tar.gz
RUN cd gearmand-1.1.11 && ./configure && make && sudo make install
RUN rm -rf gearmand-1.1.11*
RUN sudo ldconfig

# set some defaults
ENV GEARMAN_PORT 4730

# postgresql default configuration
ENV PSQL_USER gearman
ENV PSQL_PASS gearman
ENV PSQL_DB gearman
ENV PSQL_PORT 5432
ENV PSQL_HOST 127.0.0.1

# now add our run script
ADD bootstrap.sh bootstrap.sh





