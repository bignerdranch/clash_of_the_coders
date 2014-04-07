namespace :db do
  desc 'Make Users for every Nerd in Stable'
  task :import_nerds => :environment do
    Users::Import.run
  end
end
