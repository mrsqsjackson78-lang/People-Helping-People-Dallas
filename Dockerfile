
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y g++
COPY . /app
WORKDIR /app
g++ backend/api/crud.cpp -o api
CMD ["./api"]
