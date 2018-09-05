FROM ubuntu:16.04

#=============
# Set WORKDIR
#=============
WORKDIR /root

#================
# Install Python
#================
RUN apt-get -qqy update && \
	apt-get -qqy --no-install-recommends install \
	python2.7-dev python-pip python-setuptools python-wheel gcc \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

#=============
# EXPOSE PORT
#=============
EXPOSE 5000

#=================
# Run the project
#=================
COPY . /root/
RUN pip install -r requirements.txt
CMD /usr/bin/python -m main
