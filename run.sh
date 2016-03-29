#!/bin/bash

control_c() {
	exit #$
}

trap control_c SIGINT

while [ true ]; do
	./getmeater
	sleep 60
done