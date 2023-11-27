FROM python:3.12

# Install dependencies
RUN apt-get update && apt-get -y install jq pipx
RUN pipx install garmindb

WORKDIR /root/.GarminDb
RUN cp /usr/local/lib/python3.12/site-packages/garmindb/GarminConnectConfig.json.example /root/.GarminDb

WORKDIR /root
ADD ./run_garmin ./

ENV USERNAME "test"
ENV PASSWORD "pass"
ENV STARTDATE "01/01/2021"
ENV LATEST "20"
ENV ALL "111"

CMD ["./run_garmin"]
