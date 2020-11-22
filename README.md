![Main](https://github.com/VaultVulp/cookiecutter-python-template/workflows/Main/badge.svg)

# Cookiecutter Template for Python Projects

This template uses [Pipenv](https://pipenv.pypa.io/) as a dependency manager.

I have similar template that uses Poetry [here](https://github.com/great-glow/cookiecutter-python-template).

## Usage

1. Install [Cookiecutter](https://github.com/cookiecutter/cookiecutter) globally
    ```bash
    pip install cookiecutter
    ```
2. Use my template
    ```bash
    cookiecutter https://github.com/VaultVulp/cookiecutter-python-template
    cd <project-folder>
    git init
    pipenv install -d
    git add .
    git commit -m "Initial commit"
    ```
