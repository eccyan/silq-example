FROM fedora:latest
ADD ./install-dependencies.sh ./
ADD ./system-auth ./
RUN dnf -y install 'dnf-command(copr)' \
    && dnf -y copr enable tcg/devel \
    && dnf -y install dmd dub ldc gdb \
    && dnf -y install devscripts debhelper fakeroot file rpm-build \
    && dnf -y update && dnf clean all \
    && echo 'ALL ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && cp system-auth /etc/pam.d \
    && echo 'Defaults !requiretty' >> /etc/sudoers
RUN git clone --recursive https://github.com/eth-sri/silq.git && cd ./silq \
    && dmd -g -debug -J. -Jlibrary *.d ast/*.d util/*.d -ofsilq \
    && ln -s $(pwd)/silq /usr/local/bin/silq
CMD silq
