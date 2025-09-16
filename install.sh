#!/bin/bash

# --- Script to automatically install Ookla Speedtest on Ubuntu 24.04 ---

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root. Please use 'sudo'." 1>&2
   exit 1
fi

echo "--- Starting Speedtest CLI installation process ---"

# Step 1: Remove old speedtest-cli package and repository
echo "Step 1: Removing old Ookla speedtest-cli repository and package..."
rm -f /etc/apt/sources.list.d/speedtest.list
apt-get purge -y speedtest-cli
apt-get autoremove -y

# Step 2: Install curl to fetch the new repository script
echo "Step 2: Installing curl..."
apt-get update
apt-get install -y curl

# Step 3: Add the official Ookla repository
echo "Step 3: Adding the official Ookla repository..."
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash

# Check if the repository file was created
REPO_FILE="/etc/apt/sources.list.d/ookla_speedtest-cli.list"
if [ ! -f "$REPO_FILE" ]; then
    echo "Error: The Ookla repository file was not created. Exiting." 1>&2
    exit 1
fi

# Step 4: Fix the repository name for Ubuntu 24.04 (noble)
# The official repo doesn't support noble yet, so we use jammy.
echo "Step 4: Adjusting the repository to use 'jammy' instead of 'noble'..."
sed -i 's/noble/jammy/g' "$REPO_FILE"

# Step 5: Update the package list
echo "Step 5: Updating package lists..."
apt-get update

# Step 6: Install the official speedtest package
echo "Step 6: Installing the official speedtest package..."
apt-get install -y speedtest

echo "--- Speedtest CLI installation is complete! ---"
echo "You can now run 'speedtest' to test your internet connection."