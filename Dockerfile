FROM ruby:3.2.0
RUN apt-get update -qq
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["./bin/dev"]
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
