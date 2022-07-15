wget http://archive.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz

tar zxf tomcat-connectors-1.2.48-src.tar.gz

cd tomcat-connectors-1.2.48-src/native/

./configure --with-apxs=/usr/bin/apxs

make

make install

/etc/httpd24/build/libtool --finish /etc/httpd24/modules

mkdir /etc/httpd24/conf.modules.d

cd /etc/httpd24/conf.modules.d/

touch /etc/httpd24/conf.modules.d/02-modjk.conf


echo '
# Carga del módulo de redirección
LoadModule jk_module modules/mod_jk.so

# Configuración inicial del módulo
JkWorkersFile /etc/httpd/conf.d/workers.properties
JkLogFile /etc/httpd/logs/mod_jk.log
JkLogLevel info
JkLogStampFormat "[%a %b %d %H:%M:%S %Y] "
JkOptions +ForwardURICompatUnparsed' >> 02-modjk.conf
