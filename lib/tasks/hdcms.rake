namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app mattapan-audio-api --confirm mattapan-audio-api
      heroku run rake db:migrate --app mattapan-audio-api
      heroku run rake db:seed --app mattapan-audio-api')	
  end
end
