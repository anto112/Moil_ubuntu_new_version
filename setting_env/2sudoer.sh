#!/bin/bash

echo $DISPLAY
xhost +
clear
docker exec -it -e DISPLAY $USER bash
