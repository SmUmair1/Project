From python:3.8-slim

WORKDIR /

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/SmUmair1/Project

CMD ["python", "app.py"]

