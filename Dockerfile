# --- Base image ---
FROM ruby:3.2.2

# Set environment
ENV RAILS_ENV=production
ENV RACK_ENV=production

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install --without development test

# Copy the rest of the app
COPY . .

# Make bin/rails executable
RUN chmod +x bin/rails

# Precompile assets
# Use a dummy SECRET_KEY_BASE to avoid requiring credentials during build
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# Expose port
EXPOSE 3000

# Default command
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
