FROM centos:7
RUN  yum -y install openssh-server
RUN  useradd arvind && \
     echo "redhat" | passwd arvind --stdin && \
     mkdir /home/arvind/.ssh && \
     chmod 700 /home/arvind/.ssh 
COPY ./arvind.pub /home/arvind/.ssh/authorized_keys 
RUN  chown arvind:arvind -R /home/arvind/ && \
     chmod 600 /home/arvind/.ssh/authorized_keys
RUN /usr/sbin/sshd-keygen 
RUN yum -y install mysql python3
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
     python3 get-pip.py && \
     pip3 install awscli --upgrade
CMD /usr/sbin/sshd -D
