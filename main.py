"""Module providing env"""
from os import environ as env

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def index():
    """_summary_

    Returns:
        _type_: _description_
    """
    return {"details": f"Hello World! Secret = {env['MY_ENVIRONMENT']}"}
