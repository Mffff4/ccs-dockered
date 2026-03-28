FROM node:22-bookworm-slim

ENV CCS_HOME=/root/.ccs     NPM_CONFIG_UPDATE_NOTIFIER=false     NPM_CONFIG_FUND=false

RUN apt-get update     && apt-get install -y --no-install-recommends ca-certificates curl git bash     && rm -rf /var/lib/apt/lists/*     && npm install -g @kaitranntt/ccs

RUN ccs migrate

RUN mkdir -p /root/.ccs && ccs config --host 0.0.0.0

WORKDIR /workspace
RUN mkdir -p /workspace ${CCS_HOME}

EXPOSE 3000
VOLUME ["/root/.ccs", "/workspace"]

CMD ["sh", "-lc", "ccs config --host 0.0.0.0"]