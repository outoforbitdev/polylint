install:
    yarn install
    yarn husky install
    brew install yamllint

rebuild-staging:
    git fetch
    git checkout staging
    git checkout main
    git push origin --delete staging
    git branch -d staging
    git checkout main
    git pull
    git fetch && git checkout -b staging origin/main
    git push origin staging

test-lint:
    docker run -v $(pwd)/.test:/polylint/app polylint

lint:
    docker run -v .:/polylint/app polylint
