FROM ubuntu:wily

RUN apt-get update && apt-get install -y \
    curl \
    clang \
    git

RUN git clone https://github.com/kylef/swiftenv.git ~/.swiftenv && \
    echo 'export SWIFTENV_ROOT="$HOME/.swiftenv"' >> ~/.bash_profile && \
    echo 'export PATH="$SWIFTENV_ROOT/bin:$PATH"' >> ~/.bash_profile 

ENV SWIFT_VERSION=DEVELOPMENT-SNAPSHOT-2016-03-24-a

RUN echo 'eval "$(swiftenv init -)"' >> ~/.bash_profile && \
    . ~/.bash_profile && \
    mkdir /app && cd /app && env UBUNTU_VERSION=ubuntu15.10 swiftenv install
