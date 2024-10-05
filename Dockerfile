FROM debian:latest
ENV SRVPORT=4499
ENV RSPFILE=response
ENV PATH="/usr/games:/usr/local/games:${PATH}"
RUN apt-get update && apt-get install -y \
    fortune \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY wisecow.sh .
RUN chmod +x wisecow.sh
EXPOSE $SRVPORT
CMD ["./wisecow.sh"]

#-----------------------------------------------------------------
    
# Dockerhub repository
# https://hub.docker.com/r/karthikeyanrajapushpavanam/wisecom-app