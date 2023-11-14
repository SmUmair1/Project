From python:3.8-slim

WORKDIR /
COPY . /
RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/SmUmair1/Project

CMD ["python3", "app.py"]

