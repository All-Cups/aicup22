FROM python:3.10

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONFAULTHANDLER 1
RUN pip install numpy scipy cython sklearn lightgbm catboost numba pandas
# Doesn't work without AVX
#RUN pip install torch==1.9.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

RUN apt-get update && apt-get install -y zip unzip jq

ENV MOUNT_POINT="/opt/mount-point"
ENV SOLUTION_CODE_PATH="/opt/client/solution"
COPY . $SOLUTION_CODE_PATH
WORKDIR $SOLUTION_CODE_PATH
CMD ["bash", "entrypoint.sh"]
RUN chmod a+wr -R .