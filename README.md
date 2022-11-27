# Born2beroot-42
This Project consists of having you set up your first server by following specific rules.
Dieses Projekt besteht darin, dass Sie Ihren ersten Server nach bestimmten Regeln einrichten.

source (Quelle) : https://www.notion.so/Born2beroot-ad4abe5d9e724c70bda4e113dde1ea59
<br>
<ul>
<li> 1. <a href="#tab1">Installation!</a></li>
<li> 2. <a href="#tab2">Server configuration</a> </li>
<li> 3. <a href="#tab3">SSH (Secure Shell)</a> </li>
      <ul>
        <li><a href="#install">installing&Configuring SSH</a></li>
        <li><a href="#config">Installing & Configuring UFW firewall</a></li>
        <li><a href="#con">Connecting to a Server Using SSH</a></li>
      </ul>
<li>4. <a href="#configuration_strongpassword">To set up a strong password policy</a></li>
<li>5. <a href="#configuration_sudogroup">To set up a strong configuration for your sudo group</a> </li>
</ul>

<h1 id="tab1">Installation</h1>
First all should you installer VirtuallBox (Zuerst Soll man installer Virualbox): https://www.virtualbox.org/wiki/Downloads <br>
(and also)und auch Debian : https://www.debian.org/download <br>
This video Explain you how to can installer Debian on VirtualBox without Probleme <br>
(Dieses Video erklären Sie wie können Sie installer Debian auf VirtualBox ohne Ursachen): https://www.youtube.com/embed/OQEdjt38ZJA <br>

<h1 id="tab2">Server configuration:</h1>
<h2>Sudo install (Super User DO)</h2>
- Switch to root and its environment
<code>$ su -</code> <br>

- Install sudo: <code> $ apt install sudo: </code><br>

- if you want to verify whether sudo was successfully installed: <code> dpkg -l | grep sudo </code>

<h1 id="tab3">SSH (Secure Shell)</h1>
<h2 id="install"> Step 1: installing&Configuring SSH (Secure Shell)</h2>

- Install openssh-server: <code>sudo apt install openssh-server</code>
<img src="https://user-images.githubusercontent.com/80540449/203820571-73934c2e-bd14-4ac8-afdd-d79bdfd8391b.png" alt="Girl in a jacket" width="500">

- Verify whether openssh-server was successfully installed: <code> dpkg -l | grep ssh</code> <br>
or youn can to check the status of the SSH service: <code>sudo systemctl status ssh</code>
<img src="https://user-images.githubusercontent.com/80540449/203813058-d5d593b2-0540-4c52-b1d0-2ac77d1be9a6.png" alt="Girl in a jacket" width="500">
- Configure SSH: <code>sudo vi /etc/ssh/sshd_config</code> <br>

- To set up SSH using Port 4242.<code>13 #Port 22</code> <br>
to : <code>13 Prot 4242</code><br>

- Start and Stop the SSH Server<br>
<code>sudo service ssh start</code> <br> <br>
<code>sudo service ssh start</code><br>

<h2 id="config">Step 2: Installing & Configuring UFW</h2>
Install ufw <code>sudo apt install ufw: </code> <br>
Verify whether ufw was successfully installed: <code>dpkg -l | grep ufw</code> <br>
or check by command : <code>sudo ufw status</code> <br>
Enable Firewall: <code>sudo ufw enable</code> <br>
Allow incoming connections using Port 4242: <code>sudo ufw allow 4242</code>
<h2 id="con">Step 3: Connecting to a Server Using SSH</h2>
- Get Your Server IP Address : <code>hostname -I</code> <br>
IP adresse : <code>10.02.15</code> <br>
SSH into your virtual machine using Port 4242: <code>ssh UserName@IPAddressOrHostname</code> <br>
- Exit: <code>logout</code>

<h1 id="configuration_strongpassword">To set up a strong password policy</h1>
- Open folder /etc/login.defs to Change :
<code>$ sudo nano /etc/login.defs</code> <br>
      • Your password has to expire every 30 days. <br>
      Before -> <code>PASS_MAX_DAYS 99999</code><br>
      After -> <code>PASS_MAX_DAYS 30</code><br>
      • The minimum number of days allowed before the modification of a password will be set to 2. <br4>
      Before -> <code>PASS_MIN_DAYS 0</code><br>
      After -> <code>PASS_MIN_DAYS 2</code><br>
      • The user has to receive a warning message 7 days before their password expires. <br>
      <code>PASS_WARN_AGE 7</code><br>
      • Your password must be at least 10 characters long. It must contain an uppercase letter, a lowercase letter, and a number. Also, it must not             contain more than 3 consecutive identical characters. <br>
      To do this part you should install <code>libpam-pwquality</code> <br>
      <code>$	sudo apt install libpam-pwquality</code> <br>
      <code>$	sudo nano /etc/pam.d/common-password</code> <br>
      Your password must be at least 10 characters long. <br>
      minlen = 10 <br>
      It must contain an uppercase letter <br>
      <code>ucredit=-1</code> <br>
      It must contain an lowercase letter
      <code>lcredit=-1</code> <br>
      It must contain a number <br>
      <code>lcredit=-1</code> <br>
      it must not contain more than 3 consecutive identical characters <br>
      <code>maxrepeat=3</code><br>
      • The password must not include the name of the user. <br>
      <code>reject_username</code> <br>
      • The following rule does not apply to the root password: The password must have
      at least 7 characters that are not part of the former password. <br>
      <code>difok=7</code> <br>
      • Of course, your root password has to comply with this policy <br>
<img width="1127" alt="179329511-0619183a-8ccc-456b-8f27-3962fc542cc3" src="https://user-images.githubusercontent.com/80540449/204153082-5e0700ec-bcb2-42ad-8168-4c6169bb61c6.png">
<h1 id="configuration_sudogroup">To set up a strong configuration for your sudo group</h1>
      Open File /etc/sudoers.d
      <code>nano /etc/sudoers.d</code>, and add this :<br> <br>


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
      












