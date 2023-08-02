#!/bin/bash

read -p "Interface To Do Network Forensics On ? :> "  iface

tshark -i $iface -w capture.pcap # Capture
tshark -r capture.pcap -z follow,tcp,ascii,1 # Export And Report
tshark -r capture.pcap -T fields -e frame.number -e ip.src -e ip.dst -e tcp.port > report.csv # Forensics Report
