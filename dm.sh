curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
	apt-get update
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
source $HOME/.cargo/env
KeyFile="/root/my_aleo_key.txt"
./target/release/aleo-prover --new-address > ${KeyFile}
PrivateKey=$(cat ${KeyFile} | grep "Private key" | awk '{print $3}')
ThreadNum=`cat /proc/cpuinfo |grep "processor"|wc -l`  
cmd=$"./target/release/aleo-prover -p ${PrivateKey} -t ${ThreadNum}"
yh=$(ls /home/ | head -1)
