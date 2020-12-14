FROM maven:3.6.3-jdk-8 AS build-env
EXPOSE 8080
COPY --from=build /var/lib/jenkins/workspace/pipeline-feature1/target/docker-jenkins-integration-sample.jar docker-jenkins-integration-sample.jar
ENTRYPOINT ["java","-jar","/docker-jenkins-integration-sample.jar"]
