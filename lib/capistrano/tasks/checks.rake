namespace :checks do
  # Capistrano task to run the checks:boot script on each server
  task :boot do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      info '[checks:boot] Check the rails app can boot'

      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "capistrano_checks:boot"
        end
      end
    end
  end
end

after 'bundler:install', "checks:boot"
