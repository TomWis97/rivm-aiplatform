FROM debian

RUN apt update
RUN apt -y install python3-dev python3-pip
RUN pip3 install --upgrade tensorflow
RUN pip3 install --upgrade jupyter

# hulp igv debugging...
RUN apt-get -y install vim  


# jupyterhub ######################################################################################
RUN apt-get -y install npm nodejs
RUN python3 -m pip install jupyterhub
RUN npm install -g configurable-http-proxy

# mogelijkheid voor standalone notebook niet nodig
# RUN python3 -m pip install notebook

RUN groupadd -g 999 jupyter && \
    useradd -r -u 999 -g jupyter jupyter

# de secret is nodig...
RUN mkdir -p /usr/jupyter && \
	openssl rand -hex 32 > /usr/jupyter/jupyterhub_cookie_secret && \
    chmod a-rwx /usr/jupyter/jupyterhub_cookie_secret && \
    chmod u+rw /usr/jupyter/jupyterhub_cookie_secret && \
	chown jupyter:jupyter /usr/jupyter/jupyterhub_cookie_secret

COPY src/jupyterhub_config.py /usr/jupyter/jupyterhub_config.py

USER jupyter

# jupyterhub end ##################################################################################

# RUN mkdir /.local
# RUN mkdir /.local/share
# RUN chmod ugo+rwx /.local/share

# jupyterhub ######################################################################################
# RUN chmod ugo-rwx /.local/share/jupyterhub_cookie_secret
# set config file
# jupyterhub end ##################################################################################


EXPOSE 8080
# jupyterhub -f /usr/jupyter/jupyterhub_config.py

# CMD ["/usr/local/bin/jupyter","notebook","--port=8080","--no-browser"]
# CMD ["sh", "-c", "jupyter notebook --port=8080 --no-browser --ip=*"]
CMD while true; do sleep 60; done