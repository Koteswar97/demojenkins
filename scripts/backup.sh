#!/bin/bash
set -e

BUCKET_NAME="koteshbucket-767397794296123456789"
TIMESTAMP=$(date +%F-%H-%M)
BACKUP_FILE="/tmp/jenkins-backup-$TIMESTAMP.tar.gz"

tar -cvf jenkins_backup.tar --exclude='/var/lib/jenkins/workspace/backpipeline@tmp/durable-c6e9ac2c/jenkins-log.txt' /var/lib/jenkins/
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/
rm -f $BACKUP_FILE

echo "Backup completed and uploaded to S3: $BACKUP_FILE"
