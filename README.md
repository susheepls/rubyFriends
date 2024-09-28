# RubyFriends
This is just for personal practice with RUBY and is NOT complete
This is a full stack web app where users are able to log-in and add friends
based on just their username and description!

https://rubyfriends.onrender.com

## Getting Started

Ruby Version 3.3.4

Make sure your Ruby is the correct version, and have Rails installed.

Mac users may experience difficulties with the PATH since macs come with a pre-installed version of Ruby.
* Once that is figured out, make sure to run **bin/rails server** to start the Rails server.
* You can use **bin/rails console** in order to active the Rails console.

This app uses the free trial SMPT service provided by mailersend. If you would like to make changes to it, please check
the respective environment file in **app/config/environments**.

In order to deploy, make sure to set your desired settings in **app/config/environments**. 
The settings used to deploy on https://rubyfriends.onrender.com are as follows: 
* **Environment variables** : DATABASE_URL, RAILS_MASTER_KEY, and WEB_CONCURRENCY
* **Build Commands** : bundle install; bundle exec rake assets:precompile; bundle exec rake assets:clean;
* **Start Commands** : bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}

Testing is still in development...

