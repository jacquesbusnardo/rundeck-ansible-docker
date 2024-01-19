FROM rundeck/rundeck:SNAPSHOT

RUN sudo apt-get update \
  && sudo apt-get install python3-pip -y \
  && sudo apt-get clean -y

COPY requirements.txt ./

RUN sudo pip install --no-cache-dir --upgrade pip \
  && sudo pip install --no-cache-dir -r requirements.txt

COPY requirements.yml ./

RUN ansible-galaxy install -r requirements.yml

RUN mkdir -p /home/rundeck/.ansible/inventory

COPY ansible.cfg /home/rundeck/.ansible/
