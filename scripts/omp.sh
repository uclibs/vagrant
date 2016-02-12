echo "Installing OMP"
cd ~

# Set up the OMP database
echo "CREATE DATABASE omp DEFAULT CHARSET utf8" | mysql -uroot -pomp
echo "CREATE USER 'omp'@'localhost' IDENTIFIED BY 'omp'" | mysql -uroot -pomp
echo "GRANT ALL ON omp.* TO 'omp'@'localhost'" | mysql -uroot -pomp
echo "FLUSH PRIVILEGES" | mysql -uroot -pomp

cd www

# Clone the OMP repository
git clone https://github.com/pkp/omp .
./tools/startSubmodulesTRAVIS.sh
cp config.TEMPLATE.inc.php config.inc.php
mkdir ~/files
chgrp -R www-data cache public ~/files config.inc.php
chmod -R ug+w cache public ~/files config.inc.php

# Install Composer dependencies
cd lib/pkp
curl -sS https://getcomposer.org/installer | php
php composer.phar update

# Install OMP
wget -O - --post-data="adminUsername=admin&adminPassword=admin&adminPassword2=admin&adminEmail=omp@mailinator.com&locale=en_US&additionalLocales[]=en_US&clientCharset=utf-8&connectionCharset=utf8&databaseCharset=utf8&filesDir=%2fhome%2fomp%2ffiles&encryption=sha1&databaseDriver=mysql&databaseHost=localhost&databaseUsername=omp&databasePassword=omp&databaseName=omp&oaiRepositoryId=omp2.localhost" "http://localhost/omp/index.php/index/install/install"
