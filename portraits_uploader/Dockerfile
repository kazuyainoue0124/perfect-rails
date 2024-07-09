FROM ruby:3.2.4

RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install -g yarn

# gem
RUN mkdir /portraits_uploader
WORKDIR /portraits_uploader
COPY Gemfile /portraits_uploader/Gemfile
COPY Gemfile.lock /portraits_uploader/Gemfile.lock
RUN bundle install
COPY . /portraits_uploader

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
