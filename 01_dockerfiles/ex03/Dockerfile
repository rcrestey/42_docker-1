FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install ca-certificates curl openssh-server postfix

WORKDIR /tmp

RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

RUN bash /tmp/script.deb.sh

RUN apt-get -y install gitlab-ce

EXPOSE 443 80 30022

WORKDIR /etc/gitlab

RUN sed -i "s/http:\/\/gitlab.example.com/https:\/\/localhost/g" /etc/gitlab/gitlab.rb

RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 30022" >> /etc/gitlab/gitlab.rb

RUN echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/cert.pem\"" >> /etc/gitlab/gitlab.rb

RUN echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/key.pem\"" >> /etc/gitlab/gitlab.rb

RUN openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -nodes -subj '/CN=localhost' -days 365

RUN mkdir -p /etc/gitlab/ssl && chmod 700 /etc/gitlab/ssl && cp key.pem cert.pem /etc/gitlab/ssl/

RUN apt-get -y install rbenv && apt-get install -y tzdata

RUN sed -i -e 's/'"Port 22"'/'"Port 30022"'/g' /etc/ssh/sshd_config

RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure

CMD service ssh start && /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure && gitlab-ctl tail

#docker build -t gl .
#docker run --rm --privileged -p 80:80 -p 443:443 -p 30022:30022 -it gl
