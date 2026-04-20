
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y     build-essential     cmake     libssl-dev     libsqlite3-dev

WORKDIR /app
COPY . .
RUN g++ main.cpp -o server
EXPOSE 18080
CMD ["./server"]
