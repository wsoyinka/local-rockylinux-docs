FROM rockylinux:9.3

WORKDIR /app

RUN dnf -y install python3.11 python3-pip git  \
        && dnf clean all  \
        && pip3 install mkdocs

RUN git clone https://github.com/rocky-linux/docs.rockylinux.org.git  \
        && pip3 install -r docs.rockylinux.org/requirements.txt  \
        && ln -s /documentation docs.rockylinux.org/docs

EXPOSE 8000

CMD ["mkdocs", "serve", "-f", "docs.rockylinux.org/mkdocs.yml", "-a", "0.0.0.0:8000"]
