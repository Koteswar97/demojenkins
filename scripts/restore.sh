#!/bin/bash
set -e

BUCKET_NAME="your-s3-bucket-name"
LATEST_BACKUP=$(aws s3 ls "s3://$BUCKET_NAME/" | sort | tail -n 1 | awk '{print $4}')

echo "Downloading latest backup: $LATEST_BACKUP"
aws s3 cp "s3://$BUCKET_NAME/$LATEST_BACKUP" /tmp/

echo "Stopping Jenkins..."
sudo systemctl stop jenkins

echo "Restoring backup..."
sudo tar -xzvf "/tmp/$LATEST_BACKUP" -C /

echo "Starting Jenkins..."
sudo systemctl start jenkins

echo "Restore complete."
