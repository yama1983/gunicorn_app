# escape=`

FROM ubuntu:17.10

RUN apt-get update
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils git nginx

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> ~/.bash_profile
RUN echo '  eval "$(pyenv init -)"' >> ~/.bash_profile
RUN echo 'fi' >> ~/.bash_profile

RUN echo $PATH
RUN find / -name pyenv

RUN pyenv install 2.7.14
RUN pyenv install 3.6.3
RUN pyenv global 2.7.14 3.6.3 2.7.14

COPY ./app /app

WORKDIR /app
RUN pip2 install -r requirements2.txt
RUN pip3 install -r requirements3.txt

# これより上の処理は重いので、追加の設定はここより下に書く。
RUN apt-get install lsof

COPY ./nginx/gunicorn.conf /etc/nginx/conf.d/gunicorn.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./supervisor /etc/supervisor

RUN /etc/init.d/nginx stop
RUN update-rc.d nginx remove
RUN mv /etc/init/nginx.conf /etc/init/nginx.conf.disabled

ENTRYPOINT ["/bin/bash", "--login", "-i", "-c"]
WORKDIR /root
EXPOSE 80

CMD ["bash"]
