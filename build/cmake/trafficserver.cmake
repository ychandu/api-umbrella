# TrafficServer: HTTP caching server
ExternalProject_Add(
  trafficserver
  #URL http://mirror.olnevhost.net/pub/apache/trafficserver/trafficserver-${TRAFFICSERVER_VERSION}.tar.bz2
  URL https://github.com/apache/trafficserver/archive/${TRAFFICSERVER_VERSION}.tar.gz
  URL_HASH MD5=${TRAFFICSERVER_HASH}
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND patch -p1 < ${CMAKE_SOURCE_DIR}/patch.txt
    COMMAND autoreconf -if
    COMMAND env SPHINXBUILD=false LDFLAGS=-Wl,-rpath,${STAGE_EMBEDDED_DIR}/lib <SOURCE_DIR>/configure --prefix=${INSTALL_PREFIX_EMBEDDED} --enable-experimental-plugins
  INSTALL_COMMAND make install DESTDIR=${STAGE_DIR}
    # Trim our own distribution by removing some larger files we don't need for
    # API Umbrella.
    COMMAND rm -f ${STAGE_EMBEDDED_DIR}/bin/traffic_sac
)
