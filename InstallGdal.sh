#installation: 
set -e

./InstallProjDeps.sh
./InstallGdalDeps.sh

./BuildProj.sh
./BuildGdal.sh

# # PROJ dependencies
# apt-get update; \
#     DEBIAN_FRONTEND=noninteractive apt-get install -y  --no-install-recommends \
#         libsqlite3-0 \
#         curl unzip

# # GDAL dependencies
# DEBIAN_FRONTEND=noninteractive apt-get install -y  --no-install-recommends \
#         libopenjp2-7 python-numpy \
#         libjpeg-turbo8 libgeos-3.6.2 libgeos-c1v5 \
#         libcurl4 libexpat1 \
#         libxerces-c3.2 \
#         libwebp6 \
#         libzstd1 bash libpq5 libssl1.1


# # Order layers starting with less frequently varying ones
# mkdir -p  /usr/local/share/proj \
#     && unzip -j -u -o proj-datumgrid-latest.zip  -d /usr/local/share/proj #\
#     #&& rm -f *.zip