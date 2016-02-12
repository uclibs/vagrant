# Update Ubuntu
apt-get -y update
#apt-get -y upgrade

# Install some useful stuff
apt-get -y install openssh-server git vim wget curl

# Install LAMP server
debconf-set-selections <<< 'mysql-server mysql-server/root_password password omp'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password omp'
tasksel install lamp-server
apt-get -y install php5-gd php5-xsl php5-curl
service apache2 restart

# Create a user
adduser --gecos "" --disabled-password omp
usermod -a -G www-data omp

mkdir /var/www/html/omp
chown omp:omp /var/www/html/omp
ln -s /var/www/html/omp /home/omp/www

su -c "sh /vagrant/scripts/omp.sh" omp
