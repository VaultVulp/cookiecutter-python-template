import asyncio

from loguru import logger

from {{cookiecutter.project_slug}}.logger import setup_logger


def main():
    try:
        asyncio.run(setup_logger())
        asyncio.run(do_work())
    except (KeyboardInterrupt, SystemExit):
        logger.info('Closing an app')
    except Exception:
        logger.exception('Critical Error!')

async def do_work():
    pass