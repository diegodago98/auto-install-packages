#!bin/bash

#Actualizacion maquina
apt-get update -y

#instalacion de paquetes necesiarios
apt-get install telnet gcc make 

#Desactivar firewall
systemctl disable firewalld

#Instalacion OpenSSL
wget https://www.openssl.org/source/openssl-1.1.1q.tar.gz

tar zxvf openssl-1.1.1q.tar.gz

cd openssl-1.1.1q

./config -fPIC shared --prefix=/usr/local/ssl --openssldir=/usr/local/ssl

make install

export LIBS=-ldl

export LD_LIBRARY_PATH="/usr/local/ssl/lib"

export LDFLAGS="-L/usr/local/ssl"

export CPPFLAGS="-I/usr/local/ssl/include/openssl"

export CFLAGS="-Wl,-rpath=/usr/local/ssl/lib:/usr/lib -I/usr/local/ssl/include/openssl"


#apache-version

wget  https://dlcdn.apache.org/httpd/httpd-2.4.54.tar.gz

tar zxvf httpd-2.4.54.tar.gz

cd httpd-2.4.54.tar.gz/srclib/

wget https://dlcdn.apache.org//apr/apr-1.7.0.tar.gz
wget https://dlcdn.apache.org//apr/apr-util-1.6.1.tar.gz

tar zxvf apr-1.7.0.tar.gz
tar zxvf apr-util-1.6.1.tar.gz

mv apr-1.7.0 apr
mv apr-util-1.6.1 apr-util

cd /usr/src/httpd-2.4.54/

./configure --prefix=/etc/httpd24 --enable-so --enable-headers --enable-rewrite --enable-ssl --enable-proxy --with-included-apr --with-included-apr-util --with-ssl=/usr/local/ssl

make

make install


touch /etc/httpd24/con/extra/workers.properties

