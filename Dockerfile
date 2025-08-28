FROM python:3.12-alpine
LABEL maintainer="dimkanividimka@gmail.com"
ENV PYTHONUNBUFFERED 1
WORKDIR app/
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
RUN mkdir -p /files/static
RUN adduser --disabled-password --no-create-home my_user
RUN chown -R my_user:my_user /files/static
RUN chmod -R 755 /files/static
USER my_user