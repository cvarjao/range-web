FROM registry.access.redhat.com/rhel7/rhel

ENV NODE_URI https://nodejs.org/dist/v9.7.0/node-v9.7.0-linux-x64.tar.gz
ENV CADDY_URI https://github.com/mholt/caddy/releases/download/v0.10.11/caddy_v0.10.11_linux_amd64.tar.gz
ENV PATH $PATH:/opt/node/bin

#RUN yum install -y curl

RUN echo "Installing nodejs" &&  mkdir -p /opt/node && cd /opt/node && curl -L "${NODE_URI}" | tar -xvz --strip-components=1 && /opt/node/bin/node -v

RUN echo "Installing caddy" && mkdir -p /opt/caddy && cd /opt/caddy && curl -L "${CADDY_URI}" | tar -xvz &&  /opt/caddy/caddy -version -agree
COPY . /tmp/src/    
WORKDIR /tmp/src/
RUN /opt/node/bin/npm i
RUN /opt/node/bin/npm i escape-string-regexp
RUN /opt/node/bin/npm -v
RUN /opt/node/bin/node -v
RUN npm run build
RUN npm test


