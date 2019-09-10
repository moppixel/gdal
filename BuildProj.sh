# Build PROJ
PROJ_VERSION=6.2.0
mkdir proj \
    && tar xz -C proj --strip-components=1 -f proj-${PROJ_VERSION}.tar.gz\
    && cd proj \
    && CFLAGS='-DPROJ_RENAME_SYMBOLS -O2' CXXFLAGS='-DPROJ_RENAME_SYMBOLS -O2' \
        ./configure --prefix=/usr/local --disable-static \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf proj \
    && mv /usr/local/lib/libproj.so.15.2.0 /usr/local/lib/libinternalproj.so.15.2.0 \
    && ln -s libinternalproj.so.15.2.0 /usr/local/lib/libinternalproj.so.15 \
    && ln -s libinternalproj.so.15.2.0 /usr/local/lib/libinternalproj.so \
    && rm /usr/local/lib/libproj.*  \
    && ln -s libinternalproj.so.15.2.0 /usr/local/lib/libproj.so.15 \
    && strip -s /usr/local/lib/libinternalproj.so.15.2.0 \
    && for i in /usr/local/bin/*; do strip -s $i 2>/dev/null || /bin/true; done