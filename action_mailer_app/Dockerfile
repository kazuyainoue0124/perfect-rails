FROM ruby:3.2.4

RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install -g yarn

# gem
RUN mkdir /action_mailer_app
WORKDIR /action_mailer_app
COPY Gemfile /action_mailer_app/Gemfile
COPY Gemfile.lock /action_mailer_app/Gemfile.lock
RUN bundle install
COPY . /action_mailer_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
