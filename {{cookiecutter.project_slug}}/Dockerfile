FROM python:{{cookiecutter.python_version}}-slim as build

RUN apt-get update \
  && apt-get install -y --no-install-recommends git \
  && apt-get purge -y --auto-remove \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install -U pip && \
    pip install -U pipenv pbr

COPY Pipfile  .
COPY Pipfile.lock .

RUN pipenv lock -r > requirements.txt

COPY . .

RUN pipenv run python setup.py bdist_wheel

FROM python:{{cookiecutter.python_version}}-slim as app

WORKDIR /app

RUN set -xe \
 && apt-get update -q \
 && apt-get upgrade -y -q

COPY --from=build /app/dist/*.whl .

RUN set -xe \
 && pip install *.whl \
 && apt-get clean -y \
 && rm -f *.whl \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["python", "-m", "{{cookiecutter.project_slug}}"]