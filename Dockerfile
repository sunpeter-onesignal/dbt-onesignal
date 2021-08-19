# Based off of https://discourse.getdbt.com/t/publishing-dbt-docs-from-a-docker-container/141
FROM python:3.8-slim

# Ubuntu specific commands according to dbt doc
# RUN sudo apt-get install git libpq-dev python-dev python3-pip && \
# sudo apt-get remove python-cffi && \
# pip install --upgrade cffi && \
# pip install cryptography==1.7.2

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y openssh-client \
    && apt-get install -y --no-install-recommends libsasl2-dev gcc git 
RUN pip install --upgrade pip
RUN pip install dbt
RUN pip install dbt-postgres
RUN pip install git+http://github.com/sunpeter-onesignal/dbt-presto.git


ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts


RUN mkdir /dbt-current
VOLUME [ "/dbt-current" ]

ENV REMOTE_REPO git@github.com:OneSignal/dbt-onesignal.git
ENV REPO_DIR dbt-onesignal/onesignal

COPY "./entrypoint.sh" "/dbt-current/entrypoint.sh"
WORKDIR /dbt-current
CMD [ "/bin/bash", "entrypoint.sh" ]
