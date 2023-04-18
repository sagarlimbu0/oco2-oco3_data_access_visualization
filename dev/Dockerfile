#ARG BASE_CONTAINER=jupyter/minimal-notebook
#FROM $BASE_CONTAINER

FROM jupyter/datascience-notebook

FROM python:3.10-slim-buster AS build
RUN apt-get -y update \
	&& apt-get install -y \
	curl \
	build-essential \
	libffi-dev \
	&& rm -rf /var/lib/apt/lists/*

FROM jupyter/minimal-notebook

LABEL author="sagar limbu"

COPY . ./

RUN pip install -r requirements.txt

CMD ["jupyter", "notebook","--ip=0.0.0.0", "--port=8888", "--no-browser","--allow-root"]
