#!/bin/bash
set -e

if [ "$ENV" = "DEV" ]; then
	echo "***** alpine-jupyter start test mode *****"
	/bin/bash
elif [ "$ENV" = "LAB" ]; then
	echo "***** alpine-jupyter start jupyter-lab mode *****"
else
	echo "***** alpine-jupyter start. access localhost:8888 on your brower. *****"
	exec sh -c "jupyter notebook --ip=0.0.0.0 --notebook-dir=/jupyter/notebook --config=/jupyter/conf/jupyter_notebook_config.py"
fi

