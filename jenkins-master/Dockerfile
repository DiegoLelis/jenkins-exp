# LTS on 2019-08-28
FROM jenkins/jenkins:2.176.2 
LABEL maintainer=”dlelis@eastsidegamestudio.com”

# Jenkins Directories
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins


ENV JAVA_OPTS="-Xmx1024m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"