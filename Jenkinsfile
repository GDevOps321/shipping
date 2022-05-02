 pipeline
 {
    agent
    {
      label 'NODEJS'
     }
    stages {
       stage('Download dependencies')
       {
         steps {
            sh '''
               mvn compile
            '''
         }
        }
        stage('Make package')
               {
                 steps {
                    sh '''
                       mvn package
                    '''
                 }
                }

       stage('prepare artifact')
       {
            steps
           {
              sh '''
                 cp target/*.jar shipping.jar
                 zip -r shipping.zip shipping.jar

              '''
           }
       }
           stage('upload artifacts to nexus')
           {
              steps
              {
                 sh '''
                    curl -f -v -u admin:admin --upload-file shipping.zip http://172.31.20.130:8081/repository/shipping/shipping.zip
                 '''

              }
           }


    }
 }