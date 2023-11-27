FROM python:3.11

# Install dependencies
RUN apt-get update && apt-get -y install jq pipx
RUN pipx install garmindb

RUN pipx ensurepath
RUN . /root/.profile

WORKDIR /root/.GarminDb
RUN cp /root/.local/pipx/venvs/garmindb/lib/python3.11/garmindb/GarminConnectConfig.json.example /root/.GarminDb

WORKDIR /root
ADD ./run_garmin ./

ENV USERNAME "test"
ENV PASSWORD "pass"
ENV STARTDATE "01/01/2021"
ENV LATEST "20"
ENV ALL "111"

CMD ["./run_garmin"]
