web: bundle exec puma -t 16:16 -p 3000 -e development
worker: env TERM_CHILD=1 QUEUE=* bundle exec rake resque:work
