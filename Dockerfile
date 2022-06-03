FROM python:3.9.10-slim-bullseye

# locate the folder to dowload the model and sample files
WORKDIR /fairseq_files

RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    bzip2 \
    build-essential \
    git-lfs \
    git \ 
    && git clone https://github.com/pytorch/fairseq

RUN pip install --upgrade pip \
    && pip install \
    subword-nmt \
    pyarrow \
    sacremoses

RUN pip install --editable ./fairseq/