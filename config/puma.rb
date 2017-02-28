#!/usr/bin/env puma
environment ENV['RAILS_ENV'] || 'production'
daemonize true
pidfile "/var/www/tesda_mis/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/tesda_mis/shared/tmp/log/stdout", "/var/www/tesda_mis/shared/tmp/log/stderr"
threads 0, 16
bind "unix:///var/www/tesda_mis/shared/tmp/sockets/puma.sock"
