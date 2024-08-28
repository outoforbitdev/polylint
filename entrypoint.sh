#!/bin/sh -l

echo "Running polylint..."

# lint Dockerfile
# echo "Running hadolint..."
# echo "Done hadolint"

# lint markdown
echo "Running markdownlint-cli2..."
npx markdownlint-cli2 --version
npx markdownlint-cli2 --fix "**/*.md"
echo "Done markdownlint-cli2"

# prettier all files
echo "Running prettier..."
npx prettier --version
npx prettier /app/ --write --config /polylint/.linters/config/.prettierrc --ignore-path /polylint/.linters/config/.prettierignore
echo "Done prettier"

# lint yaml. This goes after prettier because it doesn't actually fix anything.
echo "Running yamllint..."
yamllint --version
yamllint -c /polylint/.linters/config/.yamllint.yml /app/
echo "Done yamllint"

echo "Done polylint"