from debian

RUN apt update
RUN apt -y install python3-dev python3-pip

RUN python3 -m pip

RUN pip install --upgrade tensorflow

RUN pip3 install --upgrade pip

RUN pip3 install jupyter

RUN jupiter notebook --no-browser