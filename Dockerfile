FROM outoforbitdev/node:node20-1.1.0--5dfb381

    # ======================= Install Dependencies ========================
    RUN apt-get update \
        && apt-get install --no-install-recommends -y \
        yamllint
    COPY bin /polylint

    WORKDIR /polylint

    RUN npm install -g prettier markdownlint-cli2

    COPY entrypoint.sh /polylint/entrypoint.sh
    RUN chmod +x /polylint/entrypoint.sh

    ENTRYPOINT [ "/polylint/entrypoint.sh" ]
