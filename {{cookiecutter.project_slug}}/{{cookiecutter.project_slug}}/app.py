import asyncio

from loguru import logger

from {{cookiecutter.project_slug}}.logger import setup_logger


def main():
    try:
        asyncio.run(setup_logger())
        logger.info('Starting {{cookiecutter.project_name}} ...')
        asyncio.run(do_work())
    except (KeyboardInterrupt, SystemExit):
        logger.info('Closing {{cookiecutter.project_name}}')
    except Exception:
        logger.exception('Critical Error!')


async def do_work():
    await asyncio.sleep(3)
    logger.info("Job's Done!")
