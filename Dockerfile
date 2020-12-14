FROM openjdk:8
EXPOSE 8080
COPY /var/lib/jenkins/workspace/pipeline-feature1/target/docker-jenkins-integration-sample.jar docker-jenkins-integration-sample.jar
ENTRYPOINT ["java","-jar","/docker-jenkins-integration-sample.jar"]
