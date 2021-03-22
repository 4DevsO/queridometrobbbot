FROM python:3.9.2-buster

WORKDIR /

RUN set -x \
    && pip install --upgrade pip \
    && pip install pipenv

COPY ./Pipfile .

COPY ./Pipfile.lock .

RUN pipenv install --system --dev

COPY . .

CMD bash -c "pipenv run python ./queridometro/run.py"
