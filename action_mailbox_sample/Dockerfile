FROM ruby:3.2.4

RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install -g yarn

# gem
RUN mkdir /action_mailbox_sample
WORKDIR /action_mailbox_sample
COPY Gemfile /action_mailbox_sample/Gemfile
COPY Gemfile.lock /action_mailbox_sample/Gemfile.lock
RUN bundle install
COPY . /action_mailbox_sample

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
