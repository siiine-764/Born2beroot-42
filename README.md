# Born2beroot-42
This Project consists of having you set up your first server by following specific rules.
Dieses Projekt besteht darin, dass Sie Ihren ersten Server nach bestimmten Regeln einrichten.

source (Quelle) : https://www.notion.so/Born2beroot-ad4abe5d9e724c70bda4e113dde1ea59
<br>
<ul>
<li> 1. <a href="#tab1">Installation!</a></li>
<li> 2. <a href="#tab2">Server configuration</a> </li>
<li> 3. <a href="#tab3">installing&Configuring SSH (Secure Shell)</a> </li>
      <ul>
        <li><a href="#install">installing&Configuring SSH (Secure Shell)</a></li>
        <li><a href="#config">Installing & Configuring UFW firewall</a></li>
        <li><a href="#con">installing&Configuring SSH (Secure Shell)</a></li>
      </ul>
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
<h2 id="con">Connecting to a Server Using SSH</h2>
- Get Your Server IP Address : <code>hostname -I</code> <br>
IP adresse : <code>10.02.15</code> <br>
SSH into your virtual machine using Port 4242: <code>ssh UserName@IPAddressOrHostname</code> <br>
- Exit: <code>logout</code>















