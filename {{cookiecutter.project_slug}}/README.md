![Build Status](https://github.com/{{cookiecutter.project_maintainer}}/{{cookiecutter.project_slug}}/workflows/Main/badge.svg)
{%- if cookiecutter.upload_badge_to_minio_host == 'y' %}
![Coverage Badge](https://{{cookiecutter.minio_host}}/coverage/{{cookiecutter.project_maintainer}}/{{cookiecutter.project_slug}}/coverage.svg)
{%- endif %}

# {{cookiecutter.project_name}}

{{cookiecutter.project_description}}
