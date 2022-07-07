FROM pypy:3.8

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONFAULTHANDLER 1
RUN pypy3 -m pip install numpy pandas

RUN apt-get update && apt-get install -y zip unzip jq

ENV MOUNT_POINT="/opt/mount-point"
ENV SOLUTION_CODE_PATH="/opt/client/solution"
COPY . $SOLUTION_CODE_PATH
WORKDIR $SOLUTION_CODE_PATH
CMD ["bash", "entrypoint.sh"]
RUN chmod a+wr -R .