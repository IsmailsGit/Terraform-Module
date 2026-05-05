#!/bin/bash

set -e  # This forces the script to stop immediately when something fails

dnf update -y # dnf is a package manager for linux, updates all currently installed packages on the system to their latest available versions. -y skips asking for confirmation

dnf install -y httpd wget php php-mysqlnd php-fpm php-json php-devel mariadb105-server # httpd is Apache web server and php is language WordPress runs on. wget  is  used to download files from the internet which we’ll use to download Wordpress. php-mysqlnd is a driver that allows PHP to communicate with a MySQL/MariaDB database

systemctl enable httpd # Makes sure the web server automatically starts after a reboot
systemctl start httpd # Starts the web server 


systemctl enable mariadb
systemctl start mariadb

mysql -u root <<EOF # you’re essentially connecting to the MySQL/MariaDB server as the root user. The EOF is to send multiple SQL commands into MySQL in one block  <<EOF       EOF means:“ everything between these two EOFs should be passed as input” The actual word EOF(End of File) is just a label could be anything. 

CREATE DATABASE wordpress;  # creates a database that WordPress will use to store its data
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'StrongPassword123!'; # wpuser is a database user its creating a user account for me to use localhost means the database can only connect from the same machine (the EC2 instance) password sets the password for that database user
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost'; 
# gives full permissions to all tables inside that Wordpress database * means all tables inside that database
FLUSH PRIVILEGES; # reloads the privilege tables so newly created users and permissions take effect immediately.
EOF

cd /tmp # Moved into tmp which is for temporary files, its a safe working area to download and extract files, if anything breaks the web directory doesn’t get messed up. Using /tmp allows us to safely download and prepare files before moving them into the web directory, preventing partial installs or breaking the live site.

wget https://wordpress.org/latest.tar.gz # This is downloading the WordPress files from the internet, and the .tar bundles files together and .gz compresses them

tar -xzf latest.tar.gz # This extracts the WordPress archive. The -x flag extracts, -z handles gzip compression, and -f specifies the file to extract
# This extracts the archive into a wordpress/ directory containing all WordPress files and subdirectories.

cp -r /tmp/wordpress/* /var/www/html/ # This command recursively(copying a directory along with all its subdirectories and files)copies all WordPress files from the temporary directory into the web server root directory.

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# This command creates the main WordPress configuration file by copying the sample file, allowing database connection details to be defined.
# The config file is where WordPress stores: database name, database username, database password, database host. Without it WordPress cannot connect to the database and the site will not work
# We copy the sample file because it already contains the required configuration structure, reducing errors and saving time compared to creating it from scratch.

sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
sed -i "s/username_here/wpuser/" /var/www/html/wp-config.php
sed -i "s/password_here/StrongPassword123!/" /var/www/html/wp-config.php 
#sed is a command-line tool used to edit text in files, and here it is used to replace placeholder values in the WordPress configuration file.
#the -i means to edit the file directly (in-place) instead of just printing the result, Without -i, the changes would only be printed to the terminal and not applied to the file.

chown -R apache:apache /var/www/html # This command recursively changes ownership of the web files so the Apache user and group can access and serve them
chmod -R 755 /var/www/html # This command recursively sets file permissions so the owner has full access, while group and others have read and execute access

systemctl restart httpd # Restarting Apache ensures that all configuration changes and new files are loaded and applied correctly.