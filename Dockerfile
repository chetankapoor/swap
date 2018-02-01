FROM ubuntu:latest

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN chmod +x swap.sh
CMD  sh /usr/src/myapp/swap.sh
