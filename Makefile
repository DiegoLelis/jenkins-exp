build:
	@docker build -t myjenkins ./jenkins-master
create-data:
	@docker volume create jenkins-log
	@docker volume create jenkins-data
run: create-data
	docker run \
	-p 8085:8080 -p 50000:50000 \
	--name=jenkins-master \
	--mount source=jenkins-log,target=/var/log/jenkins \
	--mount source=jenkins-data,target=/var/jenkins_home \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-d myjenkins
start:
	@docker start jenkins-master
logs:
	@docker container logs jenkins-master
get_jenkins_logs:
	@docker cp jenkins-master:/var/log/jenkins/jenkins.log jenkins.log
tail_jenkins_logs:
	@docker exec jenkins-master tail -f /var/log/jenkins/jenkins.log
check_java_env:
	@docker exec jenkins-master ps -ef | grep java
get_default_password:
	-docker exec jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword
stop:
	-docker stop jenkins-master
clean-data:
	-docker volume rm jenkins-log
	-docker volume rm jenkins-data
clean: clean-data
	-docker rm -v jenkins-master