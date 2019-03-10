#!/usr/bin/env puma

daemonize false

pidfile '/app/app.pid'
bind 'tcp://0.0.0.0:3000'

workers 3
threads 5,5
