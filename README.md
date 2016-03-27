# TestBlog

Visit our [Live Demo](https://poviotestblogwithreact.herokuapp.com/).

## Installation

### Requirements

Before you get started, the following needs to be installed:
  * **Ruby**. Version 2.2.2 is currently used and we don't guarantee everything works with other versions. If you need multiple versions of Ruby, [RVM](https://rvm.io//) is recommended.
  * [**RubyGems**](http://rubygems.org/)
  * **Bundler**: `gem install bundler`
  * [**Git**](http://help.github.com/git-installation-redirect)
  * **A database**. Only PostgreSQL has been tested, so we give no guarantees that other databases work. To install postgresql run: `sudo apt-get install postgresql`

### Setting up the development environment

1. Get the code. Cloning this git repo is probably easiest way:

  ```bash
  git clone https://github.com/sasasekaric/TestBlog.git
  ```

1. Navigate to the TestBlog project root directory.

  ```bash
  cd TestBlog
  ```

1. Install the required gems by running the following command in the project root directory:

  ```bash
  bundle install
  ```

1. Create a database.yml file by copying the example database configuration:

  ```bash
  cp config/database.example.yml config/database.yml
  ```

1. Add your database configuration details to `config/database.yml`. You will probably only need to fill in username and password for the database(s).

1. Create a .env file by copying the example configution file:

  ```bash
  cp .env.example .env
  ```

1. Setup the database:

  ```bash
  bin/setup
  ```

1. Invoke the background crontab:

  ```bash
  sudo service cron restart
  ```

1. In a new console, open the project root folder and start the server.

  ```bash
  bundle exec rails server
  ```

Congratulations! TestBlog is ready for development. Visit http://localhost:3000/


## Tests

1. Setup test database:

  ```bash
  bundle exec rake db:test:prepare
  ```

1. To run unit tests

  ```bash
  spring rspec
  ```

1. To run integration tests

  ```bash
  spring cucumber
  ```
