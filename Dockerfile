FROM ruby:2.6.7
RUN apt-get update && apt-get install -y --no-install-recommends nodejs
ENV INSTALL_PATH /opt/hbg-local
RUN mkdir -p $INSTALL_PATH
WORKDIR /opt/hbg-local
COPY Gemfile* .
RUN gem install bundler:2.2.18
RUN bundle install
COPY . .
EXPOSE 3000
CMD bundle exec puma -C config/puma.rb