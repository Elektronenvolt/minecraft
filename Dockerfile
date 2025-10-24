FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /minecraft

RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*
# get Minecraft versions from https://gist.github.com/cliffano/77a982a7503669c3e1acb0a0cf6127e9?ncyArZK=QC7pXcMw
# v 1.21.1
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565
ENTRYPOINT [ "java" ] 
CMD ["-Xms4G", "-Xmx4G", "-jar", "server.jar", "nogui" ]
