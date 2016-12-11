workers 2
threads_count = 3
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        3000
environment 'production'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

before_fork do |server, worker|
  @sidekiq_pid ||= spawn("bundle exec sidekiq -c 2")
end