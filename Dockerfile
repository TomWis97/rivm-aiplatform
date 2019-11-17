FROM debian

RUN apt update
RUN apt -y install python3-dev python3-pip
RUN pip3 install --upgrade tensorflow
RUN pip3 install --upgrade jupyter

# jupyterhub
RUN apt-get -y install npm nodejs
RUN python3 -m pip install jupyterhub
RUN npm install -g configurable-http-proxy
RUN python3 -m pip install notebook

RUN jupyterhub -h
RUN configurable-http-proxy -h
# jupyterhub

RUN mkdir /.local
RUN mkdir /.local/share
RUN chmod ugo+rwx /.local/share

EXPOSE 8080

# CMD ["/usr/local/bin/jupyter","notebook","--port=8080","--no-browser"]
# CMD ["sh", "-c", "jupyter notebook --port=8080 --no-browser --ip=*"]
CMD while true; do sleep 60; done