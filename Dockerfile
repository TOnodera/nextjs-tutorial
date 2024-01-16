FROM takeshi1215/dev_base:v1.2

LABEL mantainer="takeshi1215" 

RUN apt update
RUN wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz \
    && tar xfv node-v20.11.0-linux-x64.tar.xz \
    && mv node-v20.11.0-linux-x64/bin/node /usr/local/bin/node \
    && ln -s /node-v20.11.0-linux-x64/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -s /node-v20.11.0-linux-x64/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

ARG userid=1000
RUN useradd -m -s /bin/bash -u ${userid} node
WORKDIR /home/node/app
RUN chown -R ${userid}:${userid} /home/node/app
USER node 

