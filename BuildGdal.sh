# Build GDAL
GDAL_VERSION=3.0.1

mkdir gdal \
    && tar xz -C gdal --strip-components=1 -f gdal-${GDAL_VERSION}.tar.gz\
    && cd gdal \
    && ./configure --prefix=/usr --without-libtool \
    --with-hide-internal-symbols \
    --with-jpeg12 \
    --with-python \
    --with-webp --with-proj=/usr/local \
    --with-libtiff=internal --with-rename-internal-libtiff-symbols \
    --with-geotiff=internal --with-rename-internal-libgeotiff-symbols \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && for i in /usr/lib/*; do strip -s $i 2>/dev/null || /bin/true; done \
    && for i in /usr/bin/*; do strip -s $i 2>/dev/null || /bin/true; done
