FROM golang:1.7.5

# Install vim
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y vim && \
    apt-get clean

# Pathogen for VIM plugin management
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# VIM plugin for go
RUN git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

RUN git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar

# Glide for go dependency management
RUN curl https://glide.sh/get | sh

COPY vimrc /root/.vimrc
