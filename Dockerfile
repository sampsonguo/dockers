FROM nvidia/cuda:11.0.3-runtime-ubuntu18.04
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y && apt upgrade -y
RUN apt-get install -y unzip openssh-client openssh-server iputils-ping rsync iproute2
RUN apt-get install -y wget build-essential checkinstall libreadline-gplv2-dev  libncursesw5-dev  libssl-dev  libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev && \
    cd /usr/src && \
    wget https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tgz && \
    tar xzf Python-3.10.9.tgz && \
    cd Python-3.10.9 && \
    ./configure --enable-optimizations --prefix=/usr && \
    make install
RUN pip3 install torch==2.0 transformers datasets tiktoken wandb tqdm
