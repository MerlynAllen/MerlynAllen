#!/usr/bin/bash

npm run build && \
git add . && \
git commit -S  && \
git push & \
wrangler pages publish dist