# Based off of https://discourse.getdbt.com/t/publishing-dbt-docs-from-a-docker-container/141
FROM python:3.8-slim

# Ubuntu specific commands according to dbt doc
# RUN sudo apt-get install git libpq-dev python-dev python3-pip && \
# sudo apt-get remove python-cffi && \
# pip install --upgrade cffi && \
# pip install cryptography==1.7.2

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends libsasl2-dev gcc git 
RUN pip install --upgrade pip
RUN pip install dbt
RUN pip install dbt-postgres
RUN pip install git+http://github.com/sunpeter-onesignal/dbt-presto.git

RUN mkdir /root/.dbt
COPY profiles.yml /root/.dbt/profiles.yml
RUN mkdir /root/dbt-current
COPY src /root/dbt-current
WORKDIR /root/dbt-current
CMD [ "dbt", "rpc" ]
