[![CircleCI](https://circleci.com/gh/chetankapoor/swap.svg?style=svg)](https://circleci.com/gh/chetankapoor/swap)

# swap

A script to create swap in linux. 

Usage:
=====

Download the script using wget:

`wget https://raw.githubusercontent.com/chetankapoor/swap/master/swap.sh -O swap.sh`


Then run the script with following format:
sh swap.sh 2G 

---------------------------------------
Available options:
size - Size of swap ( Example - 1G,2G)
path - Path to create a swapfile

Usage with Docker:
================
Build the docker image first

`docker build -t swap .`

Now run the docker image

`docker run -it swap 2G`

