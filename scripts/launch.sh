#bundle exec rake db:migrate
#データベース作成
rails db:create

cp -rf /tmp/public/* /cocktailSearchApp/public/
mkdir -p tmp/sockets
bundle exec puma -C config/puma.rb 