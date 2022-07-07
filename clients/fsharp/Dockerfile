FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN apt-get update && apt-get install -y jq zip unzip

ENV MOUNT_POINT="/opt/mount-point"
ENV SOLUTION_CODE_PATH="/opt/client/solution"
COPY . $SOLUTION_CODE_PATH
WORKDIR $SOLUTION_CODE_PATH
CMD ["bash", "entrypoint.sh"]

RUN dotnet restore