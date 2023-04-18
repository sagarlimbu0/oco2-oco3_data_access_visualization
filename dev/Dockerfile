#ARG BASE_CONTAINER=jupyter/minimal-notebook
#FROM $BASE_CONTAINER

FROM jupyter/datascience-notebook

LABEL author="sagar limbu"

COPY . ./

RUN pip install -r requirements.txt

CMD ["jupyter", "notebook","--ip=0.0.0.0", "--port=8888", "--no-browser","--allow-root"]
