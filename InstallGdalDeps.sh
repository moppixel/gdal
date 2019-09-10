# Setup build env for GDAL
apt-get update -y \
    && apt-get install -y --fix-missing --no-install-recommends \
       libopenjp2-7-dev \
       python-dev python-numpy \
       libjpeg-dev libgeos-dev \
       curl libcurl4-gnutls-dev libexpat-dev libxerces-c-dev \
       libwebp-dev \
       libzstd1-dev bash zip curl \
       libpq-dev libssl-dev \
       autoconf automake sqlite3 bash-completion