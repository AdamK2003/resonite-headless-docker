#!/bin/sh

HEADLESS_DIR=/app/headless

if [ -v "$NO_UPDATE" ] && [ "$NO_UPDATE" != 0 ]; then
  /app/depotdl/DepotDownloader -username ${STEAM_USER} -password "${STEAM_PASS}" -app 2519830 -beta ${STEAM_BRANCH} -betapassword "${BETA_CODE}" -dir "/app/headless" -osarch 64
fi

rsync -acL /app/libs/ /app/headless/Headless



