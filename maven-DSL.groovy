job ('Maven-DSL') {
  description (' This is a Maven Job')
    
    scm {
        git('https://github.com/jenkins-docs/simple-java-maven-app.git', 'master',  {node -> node / 'extension' <<  ''})
        
    }

   steps {
        maven {
         mavenInstallation('arvind1')
         goals('-B -DskipTests clean package')
        }

        maven {
         mavenInstallation('arvind1')
         goals('test')
    }
       shell("""
             echo ***************Deploying JAR**********
             java -jar /var/jenkins_home/workspace/Maven-DSL/target/my-app-1.0-SNAPSHOT.jar
             """)
       }


  publishers {
            archiveArtifacts('target/*.jar')
            archiveJunit('target/surefire-reports/*.xml')
            mailer('arvindrhce12@gmail.com', false, true)
  }
}   