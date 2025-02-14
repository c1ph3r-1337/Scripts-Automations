# Packet Capture and Analysis Script

This Bash script uses **tshark** to capture network packets on a specified interface with a given filter, saves the output to a file, and then analyzes the captured packets. It is designed to automate the process of capturing network traffic for a defined period and then providing a verbose analysis of the capture.

## Features

- **Customizable Variables:**  
  Easily set the network interface, capture filter, duration, and output filename.
  
- **Automated Capture:**  
  Uses tshark to capture packets on a specified interface using a filter for a set duration.
  
- **File Existence Check:**  
  Verifies if the output file was created successfully.
  
- **Packet Analysis:**  
  If the capture is successful, the script analyzes the packet capture file in verbose mode.

## Prerequisites

- **tshark:** Ensure that tshark is installed on your system. You can install it on Debian/Ubuntu-based systems with:
  
  ```bash
  sudo apt update
  sudo apt install tshark
  ```

- **Bash:** The script is written in Bash, so it should be run on a Unix-like operating system.

## How to Use

1. **Clone or Download the Script:**  
   Save the script to your local machine, e.g., `capture_and_analyze.sh`.

2. **Make the Script Executable:**  
   Run the following command to grant execution permissions:
   
   ```bash
   chmod +x capture_and_analyze.sh
   ```

3. **Run the Script:**  
   Execute the script in your terminal:
   
   ```bash
   ./capture_and_analyze.sh
   ```

   The script will:
   - Capture packets on the interface specified by the `INTERFACE` variable (default is `eth0`).
   - Apply the filter specified by the `FILTER` variable (default is `tcp`).
   - Capture for the duration set in the `TIME` variable (default is 30 seconds).
   - Save the capture to the file defined in `OUTPUT_FILE` (default is `capture_1.pcap`).
   - Verify if the capture file exists and then analyze it using tshark in verbose mode.

## Script Overview

Below is the complete script for reference:

```bash
#!/bin/bash 

# Defining Variables 
INTERFACE="eth0"
FILTER="tcp"
TIME="30"
OUTPUT_FILE="capture_1.pcap"

# Capturing the Packets 
tshark -i $INTERFACE -f $FILTER -a duration:$TIME -w $OUTPUT_FILE

sleep $TIME # To add a pause before checking file

# Checking if File is made or not
if [ -e "$OUTPUT_FILE" ]; then  # if output file exists 
    echo "Output File is Made"
else 
    echo "Output File is Not Made"
    exit 1 # To tell system that file is not made
fi
 
# Analysing the Captured File
if [ $? -eq 0 ]; then  # $? stores the value of exit status, -eq 0 means if exit is equal to 0
    tshark -V -r $OUTPUT_FILE 
else 
    echo "Output file is not made so can't read .pcap file"
fi
```

## Customization

- **Interface:**  
  Change the value of `INTERFACE` to capture from a different network interface (e.g., `wlan0` for wireless).

- **Filter:**  
  Modify the `FILTER` variable to capture different types of traffic. For example, use `"udp"` to capture UDP packets.

- **Duration:**  
  Adjust the `TIME` variable to change how long the capture should run.

- **Output File:**  
  Set `OUTPUT_FILE` to a desired file name or path to store the capture.

## License

This project is licensed under the MIT License.

---

Feel free to fork this repository and customize the script as needed. Happy capturing!
```
