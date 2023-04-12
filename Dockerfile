ARG APP_HOME=/app
## get jupyter notebook
FROM jupyter/minimal-notebook

## get anaconda
FROM continuumio/miniconda3
# USER root

ARG APP_DIR

RUN apt-get -y update \
    && apt-get install -y \
    curl \
    build-essential \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Working directory inside app directory
WORKDIR ${APP_HOME}/

# COPY the code and everything to container
COPY . ./

## Create conda environment and activate the env.
# RUN conda create --name my_env
# RUN echo "source activate my_env" > ~/.bashrc
# ENV PATH /opt/conda/envs/env/bin:$PATH

# ## Install all libraries with requirements file
# ## RUN conda install --name my_env --file requirements.txt
# RUN conda install --yes --file requirements.txt


RUN pip install -r requirements.txt

#EXPOSE 8888
#CMD ["sh","-c", "jupyter", "notebook", "--ip='*", "--port=8888", "--no-browser", "--allow-root"]
