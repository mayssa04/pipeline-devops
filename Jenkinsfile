def commit_id
def container_name="feature_container"
node {
    
        stage('clone') {
                git 'https://github.com/Java-Techie-jt/docker-jenkins-integration-sample.git'
                 sh "git rev-parse --short HEAD > .git/commit-id"
                script {                        
                    commit_id = readFile('.git/commit-id').trim()
                }
        }
    
        stage ("maven compile"){
            def mavenHome = tool name: "maven3.6.3",type: "maven"
            def mavenCMD  = "${mavenHome}/bin/mvn "
            sh "${mavenCMD} clean package"
        }
    
       stage ("maven test"){
            def mavenHome = tool name: "maven3.6.3",type: "maven"
            def mavenCMD  = "${mavenHome}/bin/mvn "
            sh "${mavenCMD} clean test"
        }
    
        stage("qualité de code"){
            sh " mvn sonar:sonar -Dsonar.host.url=http://54.227.159.19:9000"
        }
          
        stage(' Build Docker image') {
                echo 'Building....'
                sh "docker build -t feature-image:${commit_id} ."
                echo 'build complete'
            
        }
        stage('Deploy to dev') {
                echo'Deploying'
                sh "docker stop  ${container_name}"
                sh "docker run -d --rm -p 8081:8080 --name ${container_name} feature-image:${commit_id}"
                echo 'deployment complete'
            
        }

    
}
