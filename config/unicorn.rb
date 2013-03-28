working_directory File.expand_path("../..", __FILE__)
worker_processes 2
listen "/tmp/unicorn.sock"
timeout 30
pid "/tmp/unicorn_rails3demo.pid"
# stdout_path "/vagrant/log/unicorn.log"
# stderr_path "/vagrant/log/unicorn.log"
