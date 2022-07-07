FROM maven:3-openjdk-17
RUN microdnf install jq unzip

ENV MOUNT_POINT="/opt/mount-point"
ENV SOLUTION_CODE_PATH="/opt/client/solution"
COPY . $SOLUTION_CODE_PATH
WORKDIR $SOLUTION_CODE_PATH
CMD ["bash", "entrypoint.sh"]

# TODO: wtf doesnt work?
# RUN mvn dependency:go-offline
RUN mvn package && rm -rf target

# TODO
ENV RAM_MB=256