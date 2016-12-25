FROM frolvlad/alpine-glibc:alpine-3.4
MAINTAINER pomupekun<pomupekun.gmail.com>

ENV PATH=/opt/conda/bin:$PATH

RUN apk update && \
	apk add --no-cache ca-certificates openssl bash wget && \
    wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/install_miniconda.sh && \
	bash ~/install_miniconda.sh -b -p /opt/conda && \
	conda update -y conda && \
	conda install -y jupyter && \
	rm ~/install_miniconda.sh

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--notebook-dir=/jupyter/notebook", "--config=/jupyter/conf/jupyter_notebook_config.py"]

