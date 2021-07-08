FROM jenkins/jenkins
USER root
RUN  apt update -y && apt install -y python3-distutils python3-apt
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
     python3 get-pip.py && \
     pip3 install ansible --upgrade
USER jenkins
     