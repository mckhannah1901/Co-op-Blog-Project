set :environment, 'development'

every 4.hours do
  rake 'archive'
end
