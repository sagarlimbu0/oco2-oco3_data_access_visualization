ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER

LABEL author="sagar limbu"

COPY . ./

RUN pip install -r requirements.txt
