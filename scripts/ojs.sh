echo "Installing OJS"
cd ~
cd www

# Clone the OJS repository
git clone -b qa --single-branch https://github.com/UCLIBS/ojs3 .
mkdir ~/files
chgrp -R www-data cache public ~/files config.inc.php
chmod -R ug+w cache public ~/files config.inc.php

# Install OJS
wget -O - --post-data="adminUsername=admin&adminPassword=admin&adminPassword2=admin&adminEmail=ojs@mailinator.com&locale=en_US&additionalLocales[]=en_US&clientCharset=utf-8&connectionCharset=utf8&databaseCharset=utf8&filesDir=%2fhome%2fojs%2ffiles&encryption=sha1&databaseDriver=mysql&databaseHost=localhost&databaseUsername=ojs&databasePassword=ojs&databaseName=ojs&oaiRepositoryId=ojs2.localhost" "http://localhost/ojs/index.php/index/install/install"
