FROM registry.access.redhat.com/rhel7/rhel

ENV NODE_URI 'https://nodejs.org/dist/v9.7.0/node-v9.7.0-linux-x64.tar.xz'
ENV CADDY_URI 'https://nodejs.org/dist/v9.7.0/node-v9.7.0-linux-x64.tar.xz'


RUN yum install -y curl

RUN mkdir -p /opt/node && cd /opt/node && curl "${NODE_URI}" | tar -Jx

RUN curl "https://caddyserver.com/download/build?os=linux&arch=amd64&features=DNS%2Cawslambda%2Ccors%2Cexpires%2Cfilemanager%2Cgit%2Chugo%2Cipfilter%2Cjsonp%2Cjwt%2Clocale%2Cmailout%2Cminify%2Cmultipass%2Cprometheus%2Cratelimit%2Crealip%2Csearch%2Cupload%2Ccloudflare%2Cdigitalocean%2Cdnsimple%2Cdyn%2Cgandi%2Cgooglecloud%2Clinode%2Cnamecheap%2Crfc2136%2Croute53%2Cvultr" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy
    
