ARG APP_HOME=/app
FROM python:3.8.2-slim

FROM continuumio/miniconda3

ARG APP_HOME

RUN apt-get -y update \
    && apt-get install -y \
    curl \
    build-essential \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Create Conda Env. and activate the Env.
RUN conda create -n env python=3.8
RUN echo "source activate env" > ~/.bashrc

# Set the path
ENV PATH /opt/conda/envs/evn/bin:$PATH


# Working directory
WORKDIR ${APP_HOME}/

# COPY the code and everything to container
COPY . ./

# Install all libraries with requirements file
RUN pip install -r requirements.txt 
