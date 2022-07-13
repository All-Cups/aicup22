FROM ghcr.io/graalvm/native-image:22.1.0
RUN microdnf install jq unzip maven

ENV MOUNT_POINT="/opt/mount-point"
ENV SOLUTION_CODE_PATH="/opt/client/solution"
COPY . $SOLUTION_CODE_PATH
WORKDIR $SOLUTION_CODE_PATH
ENTRYPOINT ["bash", "entrypoint.sh"]

# TODO: wtf doesnt work?
# RUN mvn dependency:go-offline
RUN mvn package && rm -rf target