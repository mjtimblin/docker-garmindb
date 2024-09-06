FROM python:3.11

# Install dependencies
RUN apt-get update && apt-get -y install jq pipx
RUN pipx install garmindb

RUN pipx ensurepath

WORKDIR /root/.GarminDb
RUN cp /root/.local/pipx/venvs/garmindb/lib/python3.11/site-packages/garmindb/GarminConnectConfig.json.example /root/.GarminDb

WORKDIR /root
ADD ./run_garmin ./

ARG USERNAME
ENV USERNAME=${USERNAME}
ARG PASSWORD
ENV PASSWORD=${PASSWORD}
ARG STARTDATE
ENV STARTDATE=${STARTDATE}
ARG LATEST=30
ENV LATEST=${LATEST}
ARG ALL=3000
ENV ALL=${ALL}
ENV PATH "/bin:/root/.local/bin:$PATH"

CMD ["./run_garmin"]
