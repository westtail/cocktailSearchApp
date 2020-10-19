# dockerfile
# 開発rubyバージョン指定
FROM ruby:2.5.1

# 必要なパッケージのインストール
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs
RUN apt-get install -y  fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatspi2.0-0 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxss1 libxtst6 xdg-utils \
    unzip zip

# chome関連をインストール
# エラーとして　chromeのバージョンとchromedriverのバージョンが違うとエラーが出ることがある
#なので`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`で最新バージョンを指定
RUN curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN curl -O https://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip

#rails コンソールで日本語を使えるようにする
ENV LANG C.UTF-8

# 作業ディレクトリの作成、設定
RUN mkdir /cocktailSearchApp

##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照 # ENV 環境変数の定義
ENV APP_ROOT /cocktailSearchApp

# WORKDIR 作業ディレクトリの指定 WORKDIR  /develop だと $pwd 結果 develop/
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . $APP_ROOT

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets

RUN mkdir -p /tmp/public && \
    cp -rf /cocktailSearchApp/public/* /tmp/public