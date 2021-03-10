sudo apt-get install git python-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv
sudo adduser --disabled-password cowrie
sudo su - cowrie
git clone http://github.com/cowrie/cowrie
cd cowrie
virtualenv --python=python3 cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install --upgrade -r requirements.txt
sudo apt-get install authbind
sudo touch /etc/authbind/byport/22
sudo chown cowrie:cowrie /etc/authbind/byport/22
sudo chmod 770 /etc/authbind/byport/22
echo "[ssh]" >> bin/cowrie.cfg
echo "listen_endpoints = tcp:22:interface=0.0.0.0" >> bin/cowrie.cfg 
bin/cowrie start
