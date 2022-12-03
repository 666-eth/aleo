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

        screen -dmS ${ScreenName}
	PrivateKey=$(cat ${KeyFile} | grep "Private key" | awk '{print $3}')
        echo "使用密钥${PrivateKey}启动prover节点"
	ThreadNum=`cat /proc/cpuinfo |grep "processor"|wc -l`  
        cmd=$"./target/release/aleo-prover -p ${PrivateKey} -t ${ThreadNum}"
	echo ${cmd}

        screen -x -S ${ScreenName} -p 0 -X stuff "${cmd}"
        screen -x -S ${ScreenName} -p 0 -X stuff $'\n'

