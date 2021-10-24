# Let's use the latest version of Ruby for this project
FROM ruby:3.0

# Install some debugging tools and linters.
RUN gem install byebug rubocop bundler

# Set the working directory to "/app"
WORKDIR /app

# Copy the Gemfiles early in the docker stack
COPY Gemfile Gemfile.lock /app

# Install the gems
RUN bundle install

# Copy everything else to the working directory
COPY . /app

# I like to keep the docker commands I most use to run the application saved in a
# comment at the end of the dockerfile. Why keep it here and not in the readme?
# Good question. I guess I just think that the Readme is more permanent and official
# as it's the public face of the repo.
#
# docker build -t keet .
#
# These commands change based on what I'm working
# on lately. Usually though, I like to ssh into the container and run the ruby
# commands from there. There's a slight split second delay when running ruby
# commands straight from your host machine.
#
# docker run --rm -it -v "$(pwd)":/app keet bash
