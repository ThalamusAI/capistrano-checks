namespace :checks do
  # A simple rake tasks that checks Rails loads with
  # eager loading turned up in the same way as happens
  # when the webserver or rails console is started
  #
  # This is run on each server but the :boot task below
  namespace :checks do
    task boot: :environment do
      Rails.application.eager_load!
      puts "Successfully loaded Rails in #{Rails.env} mode at #{Time.now}"
    end
  end

  # Capistrano tasks to run the checks:boot script on each server
  task :boot do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      info '[checks:boot] Check the rails app can boot'

      within release_path do
        with rails_env: fetch(:rails_env) do
          #execute %q{bash -l -c "bundle exec rails runner 'Time.now'"}
          execute :rake, "checks:boot"
        end
      end
    end
  end

  before "deploy:migrate", "checks:boot"
end
