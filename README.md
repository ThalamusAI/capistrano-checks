# Capistrano Checks

This gem provides checks to ensure your Rails application will boot properly after deployment.

If you've ever run into the problem that your application is fine in development and CI, but fails when it hits a server, this Gem protects you by aborting the deployment if the Rails server cannot load.

## Installation

This gem must appear in both **development and production** groups so add one of these to your application's Gemfile:

```ruby
gem 'capistrano-checks'
```

or

```ruby
group :development, :production do
  gem 'capistrano-checks'
end
```

And then execute:

```bash
$ bundle
```

You then need to add this to your `Capfile` preferably directly under `require "capistrano/bundler"`

```ruby
require "capistrano/checks"
```

Note that checks run directly after the `bundler:install` stage.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thalamusai/capistrano-checks.
