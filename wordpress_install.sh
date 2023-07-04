 #!/bin/bash  
 # Script voor installatie en configuratie van Wordpress
 
 IP=$(hostname -I | cut -f1 -d' ')
 echo"$IP"

 #wordpress_db="wordpress_db" 
   
 ## Update systeem  
 sudo apt update -y  
 sudo apt upgrade -y 
 
 ## Installeer Apache  
 sudo apt install apache2 -y  
 sudo systemctl restart apache2.service  
 sudo systemctl enable apache2.service  
   
 ## Installeer MySQL database server  
 sudo apt-get install mysql-server -y
 sudo systemctl restart mysql.service  
 sudo systemctl enable mysql.service  
 
 ## Installeer PHP  
 sudo apt-get install php libapache2-mod-php php-mysql -y
 
 sudo apt-get install wordpress -y
 sudo touch /etc/apache2/sites-available/wordpress.conf
 sudo chmod 777 $/etc/apache2/sites-available/wordpress.conf
 
 sh -c "echo 'Alias /blog /usr/share/wordpress
<Directory /usr/share/wordpress>
    Options FollowSymLinks
    AllowOverride Limit Options FileInfo
    DirectoryIndex index.php
    Order allow,deny
    Allow from all
</Directory>
<Directory /usr/share/wordpress/wp-content>
    Options FollowSymLinks
    Order allow,deny
    Allow from all
</Directory>' >> /etc/apache2/sites-available/wordpress.conf"

sudo a2ensite wordpress
sudo a2enmod rewrite
sudo service apache2 reload

sudo mysql -u root <<MYSQL
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES
ON wordpress.*
TO wordpress@localhost
IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
quit
MYSQL

sudo touch /etc/wordpress/config-$IP.php
sudo chmod 777 config-$IP.php
sudo printf "
<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'localhost');
define('DB_COLLATE', 'utf8_general_ci');
define('WP_CONTENT_DIR', '/usr/share/wordpress/wp-content');
?>" >> /etc/wordpress/config-$IP.php

sudo service mysql start
sudo systemctl reload apache2
sudo systemctl restart apache2 

echo "####################"
echo "Installatie Wordpress voltooid. "
echo "####################"