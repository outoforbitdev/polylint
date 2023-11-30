FROM outoforbitdev/node:node20-0.2.0-staging.5--6c8bcce

    # ======================= Install Dependencies ========================
    RUN apt-get update \
        && apt-get install --no-install-recommends -y \
        yamllint
    COPY bin /polylint
    COPY entrypoint.sh /polylint/entrypoint.sh
    RUN chmod +x /polylint/entrypoint.sh

    WORKDIR /polylint

    RUN npm install

    ENTRYPOINT [ "/polylint/entrypoint.sh" ]
