FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-runtime

# Instalar las dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    libopenblas-dev \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    gfortran \
    pkg-config \
    libfreetype6-dev \
    libpng-dev \
    wget \
    unzip \
    openjdk-8-jre \
    && apt-get clean


RUN mkdir /opt/code
# RUN mkdir /opt/requirements
WORKDIR /opt/code

COPY requirements.txt /opt/code/requirements.txt
RUN pip install -r /opt/code/requirements.txt
# COPY environment.yml /opt/environment.yml

# COPY ../ /opt/code/