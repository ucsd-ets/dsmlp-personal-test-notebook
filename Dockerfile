# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ucsdets/datahub-base-notebook:2023.1-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get update
RUN apt-get -y install htop clamav clamav-daemon tmux git nano tcpdump
# test btop
# RUN apt-get -y install bpytop

# 3) install packages using notebook user
USER $NB_UID

# RUN conda install -y scikit-learn

RUN pip install --no-cache-dir networkx scipy tqdm ipywidgets numpy 

# Testing for DSC170
RUN pip install --no-cache-dir pandas geopandas keplergl mesa-geo mesa matplotlib

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
