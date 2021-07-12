FROM fishtownanalytics/dbt:0.19.0

# Ubuntu specific commands according to dbt doc
# RUN sudo apt-get install git libpq-dev python-dev python3-pip && \
# sudo apt-get remove python-cffi && \
# pip install --upgrade cffi && \
# pip install cryptography==1.7.2

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends libsasl2-dev gcc
RUN pip install --upgrade pip
RUN pip install dbt-presto dbt-postgres

WORKDIR /dbt
ENTRYPOINT [ "dbt" ]
