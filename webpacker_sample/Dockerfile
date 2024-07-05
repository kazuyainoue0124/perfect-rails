FROM ruby:3.2.4

RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install -g yarn

# gem
RUN mkdir /webpacker_sample
WORKDIR /webpacker_sample
COPY Gemfile /webpacker_sample/Gemfile
COPY Gemfile.lock /webpacker_sample/Gemfile.lock
RUN bundle install
COPY . /webpacker_sample

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
