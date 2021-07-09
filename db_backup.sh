#/bin/bash
DATE=$(date +%H-%M-%S_%d-%m-%y)
BACKUP=db-$DATE.sql
HOST=$1
DB_PASS=$2
DB_NAME=$3
AWS_ACCESS=$4
AWS_SEC=$5
BUCKET_NAME=$6
	
mysqldump -u root -h $HOST -p$DB_PASS $DB_NAME > /tmp/$BACKUP && \

export AWS_ACCESS_KEY_ID=$AWS_ACCESS && \
export AWS_SECRET_ACCESS_KEY=$AWS_SEC  && \

echo " uploading dabase backup $BACKUP to aws s3 bucket $BUCKET_NAME"
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP