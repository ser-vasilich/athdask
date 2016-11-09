FROM ubuntu:16.04
MAINTAINER Sergiy Savchuk 

RUN apt-get update -yqq && apt-get -yqq install \
  wget \
  bzip2 \
  git \
  curl \
  python3-pip \
  python3-matplotlib \
  build-essential

# Configure environment
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Install arctic
RUN pip3 install --upgrade pip; pip3 install six Cython jupyter; pip3 install -U scikit-learn 
RUN pip3 install git+https://github.com/manahl/arctic.git
RUN pip3 install dask distributed --upgrade
RUN ipython3 kernelspec install-self

# Add ArcticMisc
COPY ArcticMisc ArcticMisc
RUN cd ArcticMisc; python3 setup.py install; cd ..

# Install some dependencies.
RUN pip3 --no-cache-dir install ipykernel && \
    python3 -m ipykernel.kernelspec && \
    rm -rf /root/.cache

# Add a notebook profile.
RUN mkdir -p /root/notebook && \
    mkdir -p -m 700 /root/.jupyter/ && \
    echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py

VOLUME /notebooks
WORKDIR /notebooks

