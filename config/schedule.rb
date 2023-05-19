set :output, "#{path}/log/cron.log"

every 1.day, at: '6:00 am' do
  rake 'scrape:products', environment: 'development'
end

every 1.day, at: '6:30 am' do
  rake 'products:check_sync', environment: 'development'
end

