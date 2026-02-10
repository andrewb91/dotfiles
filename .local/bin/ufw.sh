#!/bin/bash

# This script is a simple firewall rule management tool that updates the firewall rules on a Linux system to allow incoming connections on a specified port from a specified hostname.

# First, the script sets the HOSTNAME and PORT variables to the first and second arguments passed to the script, respectively. It then uses regular expressions to validate the HOSTNAME and PORT values. If either value is invalid, the script prints an error message and exits.

# Next, the script checks if the user has root permissions by checking if the user's id is 0. If the user does not have root permissions, the script prints a notice and exits.

# The script then uses the host command to resolve the hostname to an IP address and saves the result in the IP_ADDRESS variable. It then checks the current firewall rules to see if there is already a rule that allows incoming connections from the hostname and saves the IP address from that rule in the IP_IN_RULE variable.

# If the IP_ADDRESS variable is not a valid IP address, the script prints an error message and exits with a non-zero exit code. If the IP_ADDRESS and IP_IN_RULE variables are the same, the script prints a message and exits successfully. Otherwise, if the IP_IN_RULE variable has a non-empty value, the script removes the existing firewall rule that allows incoming connections from the hostname. It then inserts a new firewall rule that allows incoming connections from the hostname's IP address on the specified port, with a comment that includes the hostname.

# Set the hostname and port variables
HOSTNAME=$1
PORT=$2

if egrep -q -v '^([a-z0-9]{1,63}|[a-z0-9][a-z0-9-]{0,61}[a-z0-9])(\.[a-z0-9]{1,63}|[a-z0-9][a-z0-9-]{0,61}[a-z0-9])*$' <<< "$HOSTNAME"; then
  # HOSTNAME is not valid, print an error message and exit the script
  echo "Error: HOSTNAME is not valid"
  exit
fi

if ! [[ $PORT =~ ^[0-9]+$ ]]; then
  # The provided port is not valid, print an error message and exit the script
  echo "Error: PORT is not valid"
  exit
fi

# Check if the user has root permissions
if [ $(id -u) != 0 ]; then
  # Print a notice that explains why the script exited
  echo "This script must be run as root. Exiting..."
  # Exit the script
  exit
fi

IP_ADDRESS=$(host $HOSTNAME | grep "has address" | awk '{print $4}')
IP_IN_RULE=$(ufw status | grep "$HOSTNAME" | tr -s ' ' | awk '{print $3}')

# Use a regular expression to validate the IP address
if [[ ! $IP_ADDRESS =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  # Print an error message and exit with a non-zero exit code
  echo "The IP address is invalid" >&2
  exit 1
fi

# Compare the two IP addresses
if [[ $IP_ADDRESS == $IP_IN_RULE ]]; then
  # If the IP addresses are the same, print a message and exit the script
  echo "The IP address in the hostname and the IP address in the firewall rule are the same"
  exit 0
else
  # If the IP addresses are different, check if the IP_IN_RULE variable is set
  if [ -n "$IP_IN_RULE" ]; then
    # The variable has a non-empty value, so it was set
    # Use the full path to the ufw command to remove the firewall rule with the IP address and port in the IP_IN_RULE and PORT variables
    /usr/sbin/ufw delete allow from $IP_IN_RULE to any port $PORT
  fi
  /usr/sbin/ufw insert 1 allow from $IP_ADDRESS to any port $PORT comment $HOSTNAME
fi
