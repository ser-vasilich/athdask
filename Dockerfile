FROM ogrisel/distributed
MAINTAINER Sergiy Savchuk 

RUN apt-get update -yqq && apt-get -yqq install \
  liblz4-tool \
  build-essential

# Install arctic
RUN pip install --upgrade pip; pip install six Cython 
RUN pip install git+https://github.com/manahl/arctic.git

# Add ArcticMisc
COPY ArcticMisc ArcticMisc
RUN cd ArcticMisc; python setup.py install; cd ..

