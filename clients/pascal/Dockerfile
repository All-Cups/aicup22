FROM debian:11

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget binutils gcc libgtk2.0-0 libgtk2.0-dev psmisc jq zip unzip

RUN wget http://downloads.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.12/fpc-laz_3.2.0-1_amd64.deb && dpkg -i fpc-laz_3.2.0-1_amd64.deb && rm fpc-laz_3.2.0-1_amd64.deb
RUN wget http://downloads.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.12/fpc-src_3.2.0-1_amd64.deb && dpkg -i fpc-src_3.2.0-1_amd64.deb && rm fpc-src_3.2.0-1_amd64.deb
RUN wget http://downloads.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.12/lazarus-project_2.0.12-0_amd64.deb && dpkg -i lazarus-project_2.0.12-0_amd64.deb && rm lazarus-project_2.0.12-0_amd64.deb

RUN apt-get clean && apt-get autoremove -y

ENV MOUNT_POINT="/opt/mount-point"
ENV SOLUTION_CODE_PATH="/opt/client/solution"
COPY . $SOLUTION_CODE_PATH
WORKDIR $SOLUTION_CODE_PATH
CMD ["bash", "entrypoint.sh"]