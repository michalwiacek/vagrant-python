sudo apt-get -y update
sudo apt-get -y install puppet
sudo sed -i -re 's/127.0.0.1 (localhost.localdomain localhost )?/127.0.0.1 localhost.localdomain localhost /g' /etc/hosts