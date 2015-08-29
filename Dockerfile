FROM tochiai/qiita_stocker_2
MAINTAINER tochiai <go.ahead.oti@gmail.com>
WORKDIR /railsprojects/qiita_stocker

RUN git pull -u origin master
         bundle install
         npm install

CMD bundle exec rake assets:precompile RAILS_ENV=production
         export SECRET_KEY_BASE=`bundle exec rake secret`
         bundle exec rails s -b 0.0.0.0 -e production