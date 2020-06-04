from loguru import logger

from {{cookiecutter.project_slug}}.logger import setup_logger


def main():
    setup_logger()
    try:
        pass
    except (KeyboardInterrupt, SystemExit):
        logger.info('Closing an app')
    except Exception:
        logger.exception('Critical Error!')
