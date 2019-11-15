from debian

RUN apt update
RUN apt -y install python3-dev python3-pip
RUN pip3 install --upgrade tensorflow
RUN pip3 install --upgrade jupyter

EXPOSE 8889
CMD ["jupyter notebook --port=8889 --no-browser"]
# CMD ["sh", "-c", "jupyter notebook --port=8889 --no-browser --ip=*"]
# CMD while true; do sleep 60; done