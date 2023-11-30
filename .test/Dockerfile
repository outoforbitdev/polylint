FROM outoforbitdev/node:node20-0.1.0--356c4db

    # ======================= Install Dependencies ========================
    RUN apt-get update \
        && apt-get install --no-install-recommends -y \
        yamllint \
        wget
    RUN wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64
    COPY bin /polylint
    COPY entrypoint.sh /polylint/entrypoint.sh
    RUN chmod +x /bin/hadolint
    RUN chmod +x /polylint/entrypoint.sh

    WORKDIR /polylint

    RUN npm install

    ENTRYPOINT [ "/polylint/entrypoint.sh" ]
