#!/bin/bash 

#Defining Variables 

INTERFACE="eth0"
FILTER="tcp"
TIME="30"
OUTPUT_FILE="capture_1.pcap"

#Capturing the Packets 
tshark -i $INTERFACE -f $FILTER -a duration:$TIME -w $OUTPUT_FILE

sleep $TIME #To add a pause before checking file

#Checking if File is made or not

if [ -e "$OUTPUT_FILE" ]; then  #if output fill is there 
	echo "Output File is Made"
else 
	echo "Output File is Not Made"
	exit 1 #To tell system that File is not made
fi
 
#Analysing the Captured File

if [ $? -eq 0 ]; then # $? stores the value of of exit and -eq 0 means if exit is eqaul to 0
	tshark -V -r $OUTPUT_FILE 
else 
	echo "Output file is not made so can't read .pcap file"
fi
