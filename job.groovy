job (' New-DSL-1') {
  description (' This job will build and deploy the web app')
  
    parameters {
           stringParam('Planet', defaultValue = 'world', description = 'This is the work DSL job')
           choiceParam('OPTION', ['option 1 (default)', 'option 2', 'option 3'])
           booleanParam('RUN_TESTS', true, 'uncheck to disable tests')
    }
    
    scm {
        git('https://github.com/ak12a/jenkins-demo.git', 'master')
    }

    triggers {
        cron('H/1 * * * *') 
    }

   steps {
        shell("""
           echo 'Hello world!'
           echo 'Running Scripts'
           """
        )
       shell("echo 'hellow India'")
       shell("echo 'Hello Bihar'")
    } 
  publishers {
        mailer('arvindrhce12@gmail.com', true, true)
  }
} 