# Update Ubuntu
apt-get -y update
#apt-get -y upgrade

# Install some useful stuff
apt-get -y install openssh-server git vim wget curl dialog apt-utils unzip

# Install LAMP server
apt-get -y install php7.4 php7.4-gd php7.4-xsl php7.4-curl php-mysqli mysql-server

debconf-set-selections <<< 'mysql-server mysql-server/root_password password ojs'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password ojs'
service apache2 restart

# Create a user
adduser --gecos "" --disabled-password ojs
usermod -a -G www-data ojs

mkdir /var/www/html/ojs
chown ojs:ojs /var/www/html/ojs
ln -s /var/www/html/ojs /home/ojs/www

# Set up the OJS database
echo "CREATE DATABASE ojs DEFAULT CHARSET utf8" | sudo mysql -uroot --password=ojs
echo "CREATE USER 'ojs'@'localhost' IDENTIFIED BY 'ojs'" | sudo mysql -uroot -password=ojs
echo "GRANT ALL ON ojs.* TO 'ojs'@'localhost'" | sudo mysql -uroot -password=ojs
echo "FLUSH PRIVILEGES" | sudo mysql -uroot -password=ojs

su -c "sh /vagrant/scripts/ojs.sh" ojs
