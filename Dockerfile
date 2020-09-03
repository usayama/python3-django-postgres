FROM python:3

RUN apt-get update
RUN apt-get -y install locales && \
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install -r requirements.txt

RUN apt-get install -y --no-install-recommends fonts-noto-cjk \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip \
  && unzip NotoSerifCJKjp-hinted.zip -d /usr/share/fonts/opentype/noto \
  && rm NotoSerifCJKjp-hinted.zip \
  && chmod 644 /usr/share/fonts/opentype/noto/*
