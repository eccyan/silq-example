FROM fedora:latest
ADD ./install-dependencies.sh ./
ADD ./system-auth ./
RUN dnf -y install 'dnf-command(copr)' \
    && dnf -y install ldc \
    && dnf -y install devscripts debhelper fakeroot file rpm-build \
    && dnf -y update && dnf clean all \
    && echo 'ALL ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && cp system-auth /etc/pam.d \
    && echo 'Defaults !requiretty' >> /etc/sudoers
RUN git clone https://github.com/eth-sri/silq.git && cd ./silq \
    && /bin/bash -x ./dependencies-release.sh \
    && /bin/bash -x ./build-release.sh \
    && ln -s $(pwd)/silq /usr/local/bin/silq
CMD silq