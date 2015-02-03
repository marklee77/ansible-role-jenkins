FROM marklee77/baseimage-ansible:latest
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/dockerbuild/jenkins
WORKDIR /var/cache/dockerbuild/jenkins

RUN ansible-playbook -i inventories/local.ini provisioning/install.yml -e '{ \
      "jenkins_dockerize_context" : "docker" }' && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN mkdir -p /etc/my_init.d && \
    cp scripts/startjenkins.sh /etc/my_init.d/10-jenkins && \
    chmod 0755 /etc/my_init.d/10-jenkins

VOLUME [ "/var/run/jenkins", "/var/cache/jenkins", "/var/lib/jenkins", \
         "/var/log/jenkins" ]

EXPOSE 3306
