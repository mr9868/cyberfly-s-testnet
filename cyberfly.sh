# My Header
function myHeader(){
clear;
echo  "============================================================"
echo  "=             Cyberfly's Testnet Auto Installer            ="
echo  "=                    Created by : Mr9868                   ="
echo  "=             Github : https://github.io/Mr9868            ="
echo  "=                 Your OS info : $(uname -s) $(uname -m)              ="
echo  "=                 IP Address : ${myIP}               ="
echo -e "============================================================\n"
}

command -v docker >/dev/null 2>&1 || { echo >&2 "Docker is not found on this machine, Installing docker ... "; sleep 5;sudo apt install -y docker docker.io;}


myHeader;
read -p "Submit your kadena address: " kadenaAddr;
until [ -n $kadenaAddr ];
do
myHeader
echo "Address cannot be NULL !"
read -p "Submit your kadena address : " kadenaAddr;
done;
read -p " Submit your kadena private key : " privKey;
until [ -n $privKey ];
do
myHeader
echo "Submit your kadena address : ${kadenaAddr}";
echo "Private key cannot be NULL !"
read -p "Submit your kadena private key : " privKey;
done

git clone https://github.com/cyberfly-io/cyberfly-node-docker.git
cd cyberfly-node-docker
git pull
sudo chmod +x start_node.sh
sudo ./start_node.sh k:${kadenaAddr} ${privKey} && 
myHeader; 
echo "Installation Complete ✅"
echo "GO TO https://node.cyberfly.io or http://YOUR_IP_ADDRESS:31000  to claim the faucet"
echo "GO TO http://YOUR_IP_ADDRESS:31000 for doing the task !"
