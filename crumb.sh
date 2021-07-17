#!/bin/bash

# To get crumb and store it into variable 

crumb=$(curl -u "devops:1234" -s 'http://node1:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

# Now execute build the job using script from remote server 
curl -u "devops:1234" -H "$crumb" -X POST  http://node1:8080/job/ENV-TEST/build?delay=0sec