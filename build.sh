#!/usr/bin/env bash
# exit on error
set -o errexit

# Initial setup
# mix deps.clean --all
mix deps.get
mix deps.update --all
MIX_ENV=prod mix compile

# Compile assets
# npm install --prefix ./assets
# npm run deploy --prefix ./assets
# mix phx.digest

# Build the release and overwrite the existing release directory
MIX_ENV=prod mix release --overwrite


