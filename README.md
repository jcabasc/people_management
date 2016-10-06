PeopleApp
===================

People App is a RoR application that manage people throughout basic operations (CRUD)
and notify people via email on certain situations (when a user has been added or removed).

Project delivery date: `Tuesday 07 Oct 2016 07:00`

Developed by: `Jonathan Cabas Candama`

# Requirements

* Ruby 2.2.5
* Rails 4.2.7.1
* MySQL
* Redis
* Resque

# Installing Dependencies

```
  $ brew install mysql
  $ brew install redis
```

# Setting up Database

Copy the existing format of the database.yml and add your custom setup if needed

``
  $ cp config/database.yml.example config/database.yml
``

For further information regarding the configuration, please visit `https://www.mysql.com/`

Then run the following to setup rails db and populate it immediately

`$ rake db:setup`

# Getting Started

Before starting to run the application make sure MySQL is up and running.

The following command will start the web and worker server and redis on development mode

``
  $ foreman start -f Procfile
``

# Testing

The testing framework that was used is `Minitest`

In order to run test, it is just a matter to run the following command:

``
  $ rake test
``