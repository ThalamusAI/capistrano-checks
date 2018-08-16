class CapistranoChecks::Railtie < Rails::Railtie
  rake_tasks do
    load 'capistrano/tasks/rails.rake'
  end
end
