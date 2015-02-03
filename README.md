marklee77.jenkins
=================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-jenkins.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-jenkins)

The purpose of this role is to deploy Jenkins-CI onto Ubuntu. There is also an
support for an experimental "dockerized" deployment. This dockerized deployment
copies the role to the target machine and uses the original ansible-based
functionality to build a docker image, and then uses recent ansible features to
manage the running service. The dockerized deployment can theoretically deploy
to any Linux platform with a running docker install and the docker-py python
client library installed.

Travis status above refers only to the non-dockerized deployment, as docker does 
not (easily) run on travis.

Role Variables
--------------

Configuration variables are shown below along with default values.
- jenkins_apt_key_url: https://jenkins-ci.org/debian/jenkins-ci.org.key
- jenkins_apt_repository: deb http://pkg.jenkins-ci.org/debian binary/
+ jenkins_http_port: 80
- jenkins_https_port: 443
- jenkins_enable_ssl: true
- jenkins_require_ssl: true
- jenkins_ssl_cert_file: /etc/ssl/certs/jenkins.pem
- jenkins_ssl_key_file: /etc/ssl/private/jenkins.pem

The variables below only affect the dockerized deployment:

- jenkins_dockerized_deployment: false
- jenkins_docker_username: default
- jenkins_docker_build_image: true
- jenkins_docker_imagename: jenkins
- jenkins_docker_containername: jenkins-ci

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - marklee77.jenkins

License
-------

GPLv2

Author Information
------------------

http://stillwell.me

Known Issues
------------

- the dockerized deployment still requires sudo access, even though a member of 
  the docker group should be able to build and deploy containers without sudo.
