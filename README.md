# Born2beroot-42
This Project consists of having you set up your first server by following specific rules.
Dieses Projekt besteht darin, dass Sie Ihren ersten Server nach bestimmten Regeln einrichten.

<img src="https://user-images.githubusercontent.com/80540449/205660657-5b662557-5748-4349-918b-aa560d2ca76f.jpeg"  width="100%"/>

source (Quelle) : https://www.notion.so/Born2beroot-ad4abe5d9e724c70bda4e113dde1ea59
<br>
<ul>
<li> <h1>1. <a href="#tab1">Installation!</a></h1></li>
<li> <h1>2. <a href="#tab2">Server configuration</a> </h1></li>
<li> <h1>3. <a href="#tab3">SSH (Secure Shell)</a></h1> </li>
      <ul>
        <li><h3><a href="#install">Step 1: installing&Configuring SSH</a></h3></li>
        <li><h3><a href="#config">Step 2: Installing & Configuring UFW firewall</a></h3></li>
        <li><h3><a href="#con">Step 3: Connecting to a Server Using SSH</a></h3></li>
      </ul>
<li><h1>4. <a href="#hostname">Change hostname</a></h2></li>
<li><h1>5. <a href="#configuration_strongpassword">To set up a strong password policy</a></h1></li>
<li><h1>6. <a href="#crontab">Crontab</a></h1></li>
<li><h1>6. <a href="#configuration_sudogroup">To set up a strong configuration for your sudo group</a></h1></li>
<li>
      <h3><a href="#configuration_sudogroup">Bonus Part (WordPress Set up)</a></h3>
            <ul>
        <li><h3><a href="#lighttpd">step 1: Lighttpd</a></h3></li>
        <li><h3><a href="#mariadb">step 2: Mariadb</a></h3></li>
        <li><h3><a href="#php">step 3: PHP</a></h3></li>
        <li><h3><a href="#configwp">step 4: Download&Configuring WordPess</a></h3></li>
      </ul>
</li>
</ul>

<h1 id="tab1">Installation</h1>
First all should you installer VirtuallBox (Zuerst Soll man installer Virualbox): https://www.virtualbox.org/wiki/Downloads <br>
(and also)und auch Debian : https://www.debian.org/download <br>
This video Explain you how to can installer Debian on VirtualBox without Probleme <br>
(Dieses Video erklären Sie wie können Sie installer Debian auf VirtualBox ohne Ursachen): https://www.youtube.com/embed/OQEdjt38ZJA <br>

<h1 id="tab2">Server configuration:</h1>
<h2>Sudo install (Super User DO)</h2>
- Switch to root and its environment

      $ su -

- Install sudo:

      $ apt install sudo

- if you want to verify whether sudo was successfully installed: 

      dpkg -l | grep sudo

<h1 id="tab3">SSH (Secure Shell)</h1>
<br>
<h2 id="install"> Step 1: installing&Configuring SSH (Secure Shell)</h2>

- Install openssh-server

      sudo apt install openssh-server

<img src="https://user-images.githubusercontent.com/80540449/203820571-73934c2e-bd14-4ac8-afdd-d79bdfd8391b.png" alt="Girl in a jacket" width="500">

- Verify whether openssh-server was successfully installed: 

      dpkg -l | grep ssh

or youn can to check the status of the SSH service: 

      sudo systemctl status ssh
 
<img src="https://user-images.githubusercontent.com/80540449/203813058-d5d593b2-0540-4c52-b1d0-2ac77d1be9a6.png" alt="Girl in a jacket" width="500">
- Configure SSH: <code>sudo vi /etc/ssh/sshd_config</code> <br>

- To set up SSH using Port 4242.

      13 #Port 22
to :

      13 Prot 4242

- Start and Stop the SSH Server

      sudo service ssh start
      sudo service ssh start

<h2 id="config">Step 2: Installing & Configuring UFW</h2>
Install ufw 

      sudo apt install ufw
 
Verify whether ufw was successfully installed

      dpkg -l | grep ufw

or check by command

      sudo ufw status

Enable Firewall: 

      sudo ufw enable
 
Allow incoming connections using Port 4242: 

      sudo ufw allow 4242

<h2 id="con">Step 3: Connecting to a Server Using SSH</h2>
Get Your Server IP Address :

      hostname -I

IP adresse : 

      10.02.15

SSH into your virtual machine using Port 4242

      ssh UserName@IPAddressHostname
      
Exit: 

      logout

<h1 id="hostname">change hostname</h1>

      hostnamectl set-hostname yourname+42

refresh :

      reboot

<h1 id="configuration_strongpassword">To set up a strong password policy</h1>
- Open folder /etc/login.defs to Change :

      $ sudo nano /etc/login.defs

Your password has to expire every 30 days.
Before ->

      PASS_MAX_DAYS 99999
      
After ->

      PASS_MAX_DAYS 30
      
The minimum number of days allowed before the modification of a password will be set to 2.
Before ->

      PASS_MIN_DAYS 0
      
After ->
      PASS_MIN_DAYS 2
      
The user has to receive a warning message 7 days before their password expires.

      PASS_WARN_AGE 7

Your password must be at least 10 characters long. It must contain an uppercase letter, a lowercase letter, and a number. Also, it must not             contain more than 3 consecutive identical characters. <br> <br>
 
 To do this part you should install libpam-pwquality
 
      $	sudo apt install libpam-pwquality
 
 
      $	sudo nano /etc/pam.d/common-password
   
 Your password must be at least 10 characters long.
 
      minlen = 10
      
 It must contain an uppercase letter
 
      ucredit=-1
      
It must contain an lowercase letter

      lcredit=-1
      
It must contain a number

      lcredit=-1

it must not contain more than 3 consecutive identical characters

      maxrepeat=3

The password must not include the name of the user. <br>
      
      reject_username

The following rule does not apply to the root password: The password must have at least 7 characters that are not part of the former password.

      difok=7

 Of course, your root password has to comply with this policy
 
<img width="1127" alt="179329511-0619183a-8ccc-456b-8f27-3962fc542cc3" src="https://user-images.githubusercontent.com/80540449/204153082-5e0700ec-bcb2-42ad-8168-4c6169bb61c6.png">

<h1 id="configuration_sudogroup">To set up a strong configuration for your sudo group</h1>
      Open File /etc/sudoers.d

      nano /etc/sudoers.d
 
And add this :

      // Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
      Defaults  passwd_tries=3
      // A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo.
      Defaults  badpass_message="Opsss you make me smile :)"
      // Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the /var/log/sudo/ folder.
      Defaults  logfile="/var/log/sudo/sudo_config"
      Defaults  log_input, log_output
      Defaults  iolog_dir="/var/log/sudo"
      // The TTY mode has to be enabled for security reasons.
      Defaults  requiretty
      // For security reasons too, the paths that can be used by sudo must be restricted.
      Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
 
<h1 id="bonus">Create Group :</h1>

      sudo adduser newuser42
      
      sudo addgroup user42

      sudo usemod -aG user42 newuser42

check groups

      groups
      

<h1 id="crontab">Crontab</h1>

      sudo crontab -u root -e

Add this line in this file :

      */10 * * * * sh /ruta del script

<h1 id="bonus">Bonus Part (WordPress Set up)</h1>
<br>
<h2 id="lighttpd">step 1: Lighttpd</h2>
to install Lighttpd <br>

      sudo apt install lighttpd 

to allow port 80 (http)

      sudo ufw allow 80

Add Port :

<img width="877" alt="202720044-d7a51add-c5ee-4da4-9057-258e47cfd036" src="https://user-images.githubusercontent.com/80540449/204155978-d5bc633e-dc28-4614-ba8d-46153c486fe3.png">

to check

      sudo ufw status

<h2 id="mariadb">step 2: Mariadb</h2>
intaller Mariadb

      sudo apt install mariadb-server

check if all accessful

      dpkg -l | grep mariadb-server

Then, once the installation is complete, the <code>mysq_secure_installation</code> script must be run to define a new key for the root user and other configurations.

      sudo mysql_secure_installation

log in to the MariaDB

      sudo mariadb

enter name your database :
      
      MariaDB [(none)]> CREATE DATABASE <database-name(enorm)>

And then

      MariaDB [(none)]> GRANT ALL PRIVILEGES ON <DATABASE-NAME(enorm)>.* to <USER-NAME(molphi)>@localhost identified by '<PASSWORD>';

flush the privileges :

      MariaDB [(none)]>FLUSH PRIVILEGES;

EXIT of mariaDB

      MariaDB [(none)]> QUIT;

mariadb -u <USER-NAME> -p

      maria -u mophpi -p

Enter Password: <PASSWORD>
show your Database :

      MariaDB [(none)]> SHOW DATABASES;

      +--------------------+
      | Database           |
      +--------------------+
      | <database-name>    |
      | information_schema |
      +--------------------+

<h2 id="php">step 3: PHP</h2>

Install PHP :

      sudo apt install php-cgi php-mysql
 
to check if your PHP install accessful

      spkg -l | grep php 

<h2 id="configwp">step 4: Download&Configuring WordPess</h2>
install wget :

      sudo apt install wget 

Download wp in /var/www/html

      sudo wget http://wordpress.org/latest.tar.gz -P /var/www/html

Extract Downloaded content :

      sudo tar -xzvf /var/www/html/latest.tar.gz

Remove Tarball

      sudo rm /var/www/html/latest.tar.gz

cp content of wordpress in html <code>/var/www/html/wordpress -> var/www/html/</code>

      sudo cp -r /var/www/html/wordpress/* /var/www/html

Remove folder wordpess

      sudo rm -rf /var/www/html/wordpress

in <code>/var/www/html</code> Create WordPress configuration file

      sudo cp /wp-config-sample.php /wp-config.php

visit <code>wp-config.php</code>

      sudo vi wp-config.php
      
And replace :

      define( 'DB_NAME', 'database_name_here' );
      define( 'DB_USER', 'username_here' );
      define( 'DB_PASSWORD', 'password_here' );
      
to

      define( 'DB_NAME', '<database-name>' );
      define( 'DB_USER', '<username>' );
      define( 'DB_PASSWORD', '<password>' );
      
Configuratoin this in lighttpd :

      sudo lighty-enable-mod fastcgi

      sudo lighty-enable-mod fastcgi-php

      sudo service lighttpd force-reload
      
      
      
<img src="https://user-images.githubusercontent.com/80540449/205659975-6b66b3c4-ee83-40f2-b9c5-3a6803ad41e8.png"  width="50%"/>







      












