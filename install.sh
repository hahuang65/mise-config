#!/bin/bash

ln -sf "${PWD}/default-python-packages" "${HOME}/.default-python-packages"
ln -sf "${PWD}/default-npm-packages" "${HOME}/.default-npm-packages"
ln -sf "${PWD}/default-ruby-gems" "${HOME}/.default-gems"
ln -sf "${PWD}/default-go-packages" "${HOME}/.default-go-packages"

if [ "$(uname)" = "Darwin" ]; then
  ln -sf "${PWD}/asdf" "${HOME}/.local/bin/asdf"
fi

if ! command -v "mise" &>/dev/null; then
  echo "\`mise\` not found. Installing..."
  if [ "$(uname)" = "Darwin" ]; then
    brew install mise
  elif [ "$(uname)" = "Linux" ]; then
    paru -S mise
  fi
fi

mise use -gy \
  awscli@latest \
  bun@latest \
  golang@latest \
  golangci-lint@latest \
  gotestsum@latest \
  gum@latest \
  jqp@latest \
  lefthook@latest \
  node@latest \
  pre-commit@latest \
  python@latest \
  ruby@latest \
  staticcheck@latest \
  uv@latest \
  vhs@latest \
  yarn@latest
