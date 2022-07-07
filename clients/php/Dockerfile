FROM php:8

RUN apt-get update && apt-get install -y zip unzip jq
RUN docker-php-ext-install sockets

ENV MOUNT_POINT="/opt/mount-point"
ENV SOLUTION_CODE_PATH="/opt/client/solution"
COPY . $SOLUTION_CODE_PATH
WORKDIR $SOLUTION_CODE_PATH
CMD ["bash", "entrypoint.sh"]
RUN chmod a+wr -R .