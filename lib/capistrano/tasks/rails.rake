namespace :capistrano_checks do
  # A simple rake tasks that checks Rails loads with
  # eager loading turned up in the same way as happens
  # when the webserver or rails console is started
  #
  # This is run on each server but the :boot task below

  desc "Tests the Rails environment loads with eager loading"
  task boot: :environment do
    Rails.application.eager_load!
    puts "Successfully loaded Rails in #{Rails.env} mode at #{Time.now}"
  end
end
