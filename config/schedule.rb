set :output, '~/cron_jobs.log'

every 3.minutes do
  rake 'terminals:notify'
end
