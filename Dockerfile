FROM heroku/heroku:16
LABEL maintainer "CAMPFIRE, Inc.<tech@camp-fire.jp>"
LABEL author "Atsushi Nagase<ngs@mov.am>"

ENV NODE_ENGINE 4.9.1
ENV PATH /app/heroku/node/bin/:/app/user/node_modules/.bin:$PATH

RUN mkdir -p /app/heroku/node /app/.profile.d
WORKDIR /app/user

RUN curl -s https://s3pository.heroku.com/node/v$NODE_ENGINE/node-v$NODE_ENGINE-linux-x64.tar.gz | tar --strip-components=1 -xz -C /app/heroku/node
RUN echo "export PATH=\"/app/heroku/node/bin:/app/user/node_modules/.bin:\$PATH\"" > /app/.profile.d/nodejs.sh

RUN wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

