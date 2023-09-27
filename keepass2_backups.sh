#!/bin/bash

# Define variables
HOST="$1"
USERNAME="$2"
REMOTE_FILE="$3"
LOCAL_DIR="backups"
LOCAL_FILE="$LOCAL_DIR/$(date +%Y-%m-%d_%H-%M-%S)_$(basename $REMOTE_FILE)"

# Create local directory if it doesn't exist
mkdir -p $LOCAL_DIR

# SFTP into host and get file
sftp $USERNAME@$HOST << EOF
get $REMOTE_FILE $LOCAL_FILE
EOF
