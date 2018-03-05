FROM registry.access.redhat.com/rhel7/rhel

ENV NODE_URI https://nodejs.org/dist/v9.7.0/node-v9.7.0-linux-x64.tar.gz
ENV CADDY_URI https://github.com/mholt/caddy/releases/download/v0.10.11/caddy_v0.10.11_linux_amd64.tar.gz


#RUN yum install -y curl

RUN echo "Installing nodejs" &&  mkdir -p /opt/node && cd /opt/node && curl "${NODE_URI}" | tar -xvz

RUN echo "Installing caddy" && mkdir -p /opt/caddy && cd /opt/caddy && curl "${CADDY_URI}" | tar -xvz
    
