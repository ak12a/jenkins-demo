job (' Ansible_Db_Update_DSL') {
  description (' This job will update the html page on web server')
  
    parameters {
          
          choiceParam('AGE', ['20 (default)', '25', '30', '35', '40', '45', '43', '50'])
           
    }
    
   steps {
       wrappers {
        colorizeOutput(colorMap = 'xterm')
    }
     ansiblePlaybook('/var/jenkins_home/ansible/people.yml') {
           inventoryPath('/var/jenkins_home/ansible/hosts')
           colorizedOutput(true)
           extraVars {
           extraVar("PEOPLE_AGE", '${AGE}', false)
        }

     }
    } 
}