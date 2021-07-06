#/bin/bash
DATE=$(date +%H-%M-%S_%d-%m-%y)
BACKUP=db-$DATE.sql
HOST=$1
DB_PASS=$2
DB_NAME=$3
AWS_SEC=$4
BUCKET_NAME=$5
	
mysqldump -u root -h $HOST -p$DB_PASS $DB_NAME > /tmp/$BACKUP && \

export AWS_ACCESS_KEY_ID=AKIAWQNGCN6FVXXOHRH4 && \
#export AWS_SECRET_ACCESS_KEY=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 && \
export AWS_SECRET_ACCESS_KEY=$AWS_SEC  && \

echo " uploading dabase backup $BACKUP to aws s3 bucket $BUCKET_NAME"
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP