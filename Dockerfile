FROM python:3.7-slim AS compile-image

WORKDIR /app

COPY . .

RUN apt-get update &&  \ 
    apt-get install -y --no-install-recommends build-essential gcc &&  \ 
    pip install --user -r requirements.txt



FROM python:3.7-slim AS build-image
COPY --from=compile-image /root/.local /root/.local


ENV PATH=/root/.local/bin:$PATH
WORKDIR /app
COPY  app.py .
# nginx es como apache server y la expocision la hariamos con kubernetes ingress
CMD ["python", "app.py"]