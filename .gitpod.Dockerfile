FROM ubuntu

RUN apt-get update && apt-get install -yq \
        sudo \
        git \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
#     # To emulate the workspace-session behavior within dazzle build env
#     && mkdir /workspace && chown -hR gitpod:gitpod /workspace

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers \
    # To emulate the workspace-session behavior within dazzle build env
    && mkdir /workspace && chown -hR gitpod:gitpod /workspace


# ENV HOME=/home/gitpod
# WORKDIR $HOME

USER gitpod
