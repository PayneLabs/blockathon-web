FROM ruby:2.4
#Create the directory from which the production code will be hosted
ENV APP_DIR=/usr/
# Set the rails environment early on, so that all processes are done with production settings
ENV RAILS_ENV=production

# Install the basic dependencies for building rails-based applications
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y tzdata libmysqlclient-dev nodejs curl git

RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR

# Install rails. If you change this version, specify so in the Gemfile as well.
RUN gem install rails --no-rdoc --no-ri



# Now copy the Gemfile into the container so that we have the correct gem configuration
COPY . ./


RUN bundle install --without development test -j4

# Finally, precompile the asset pipeline
RUN bundle exec rake assets:precompile

# Publish port 8080, because that's the port that nginx-proxy looks for. Be sure this is configured in your config/puma.rb file if you're recreating this repo.
EXPOSE 8080