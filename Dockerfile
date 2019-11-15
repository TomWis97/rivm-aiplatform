from debian

RUN apt update
RUN apt -y install python3-dev python3-pip
RUN pip3 install --upgrade tensorflow
RUN pip3 install --upgrade jupyter
# RUN jupiter notebook --no-browser

CMD while true; do sleep 60; done