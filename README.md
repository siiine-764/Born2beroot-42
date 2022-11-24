# Born2beroot-42
This Project consists of having you set up your first server by following specific rules.
Dieses Projekt besteht darin, dass Sie Ihren ersten Server nach bestimmten Regeln einrichten.

source (Quelle) : https://www.notion.so/Born2beroot-ad4abe5d9e724c70bda4e113dde1ea59

<h1>Installation</h1>
First all should you installer VirtuallBox (Zuerst Soll man installer Virualbox): https://www.virtualbox.org/wiki/Downloads <br>
(and also)und auch Debian : https://www.debian.org/download <br>
This video Explain you how to can installer Debian on VirtualBox without Probleme <br>
(Dieses Video erklären Sie wie können Sie installer Debian auf VirtualBox ohne Ursachen): https://www.youtube.com/embed/OQEdjt38ZJA <br>

<h1>Server configuration:</h1>
<h2>Sudo install (Super User DO)</h2>
Switch to root and its environment
<code>
$ su - <br>
Password:
</code>
Install sudo:
<code>
$ apt install sudo<br>
</code>
- if you want to verify whether sudo was successfully installed
<code> dpkg -l | grep sudo </code>

<h1>SSH (Secure Shell)</h1>
<h2>Step 1: install openssh-server</h2>
<code>sudo apt install openssh-server</code>
Verify whether openssh-server was successfully installed
<code> dpkg -l | grep ssh</code>
or youn can to check the status of the SSH service:
<code>sudo systemctl status ssh</code>
![install-ssh-server-debian](https://user-images.githubusercontent.com/80540449/203813058-d5d593b2-0540-4c52-b1d0-2ac77d1be9a6.png)

Configure SSH
<code>sudo vi /etc/ssh/sshd_config</code>
To set up SSH using Port 4242.
replace :


















