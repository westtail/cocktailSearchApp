#bundle exec rake db:migrate
#データベース作成
rails db:create
rails db:migrate
#データベース作成 データ追加
rails db:seed

cp -rf /tmp/public/* /cocktailSearchApp/public/
mkdir -p tmp/sockets
bundle exec puma -C config/puma.rb