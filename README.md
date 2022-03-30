# Relational Rails - Snowboard Site

The Relational Rails project requires **building a relational database** with a one-to-many or parent/child relationship, and utilizing the **Rails framework** to create a website with **CRUD (create, read, update, delete) functionality**.

Following these guidlines, The Snowboard Site provides users with the ability to interact with the database containing companies (parent class) and snowboards (child class) through their web browser.  Users can view the current information from the database, add new items, update existing items, and delete items. Additional functionality includes the ability to sort a given company's snowboards alphabetically, and/or return a list of snowboards that are longer than a given length.

### Prerequisites

Users will need Ruby 2.7.4 - you can run the following command in your terminal (see https://github.com/rbenv/rbenv if you don't yet have rbenv)

```
rbenv local 2.7.4
```

### Installing

Run the following commands in your terminal to get the project up and running

Clone the project onto your local machine

```
git clone git@github.com:aspeth/snowboards.git
```

Bundle install the associated gems and check for updates

```
bundle install
bundle update
```

## Running the tests

Tests are written in RSpec - run the following command in your terminal to execute all tests

```
bundle exec rspec
```

## Viewing the Website

Start the Rails Server

```
rails s
```

### Open http://localhost:3000/ in a web browswer (Chrome and Safari work for sure, I haven't tested any others but they may work)

Click around and do the stuff!
