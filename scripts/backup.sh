#!/bin/bash
set -e

BUCKET_NAME="koteshbucket-767397794296123456789"
TIMESTAMP=$(date +%F-%H-%M)
BACKUP_FILE="/tmp/jenkins-backup-$TIMESTAMP.tar.gz"

tar -czvf $BACKUP_FILE /var/lib/jenkins
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/
rm -f $BACKUP_FILE

echo "Backup completed and uploaded to S3: $BACKUP_FILE"
