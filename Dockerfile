# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim

WORKDIR /app

ENV PORT 8000
ENV HOST 0.0.0.0

# Install pip requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

#copy local code to the container
COPY . .

EXPOSE 8000

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vdockerscode-docker-python-configure-containers
#RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#USER appuser

#EXPOSE 8000

# Keeps Python from generating .pyc files in the container 074add429712
# ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
# ENV PYTHONUNBUFFERED=1

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "-k", "uvicorn.workers.UvicornWorker", "main:app"]
CMD uvicorn main:app --port=8000 --host=0.0.0.0
