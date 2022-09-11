#!/usr/bin/bash

npm run build && \
git add . && \
git commit -S  && \
wrangler pages publish dist