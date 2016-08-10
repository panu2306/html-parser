# HTML Parser

## Outline

 - [Installation](#installation)
 - [Using API](#using-api)
 - [Unit Testing](#unit-testing)
 - [Coverage, Breakeman and Rubycritic](#coverage)

## Libraries

This project is using several libraries and frameworks:

 - [Rails 4.2.4](http://rubyonrails.org/) - Web Framework
 - [Grape](http://rdoc.info/github/intridea/grape) - API endpoints
 - [Swagger](https://github.com/ruby-grape/grape-swagger) - Swagger Compliant API documentation
 - [Swagger Ui](https://github.com/kendrikat/grape-swagger-ui) - Integrate rails assets with Swagger UI
 - [RailsAdmin](https://github.com/sferik/rails_admin) - Database dashboard
 - [MiniTest](https://github.com/seattlerb/minitest) - Unit testing
 - [Factory Girl](https://github.com/thoughtbot/factory_girl_rails) - Fixture Replacement
 - [Brakeman](https://github.com/presidentbeef/brakeman) - Security Scanner
 - [Rubycritic](https://github.com/whitesmith/rubycritic) - Code Quality Scanner

## Installation

### Dependencies

Make sure you have Ruby 2.3.0 and Git installed. Type into the terminal:

```bash
$ ruby -v
```
If you don't have bundler gem installed globally:

```bash
$ gem install bundler
```

Clone the repo

```bash
$ git clone
```

cd into the repo

```bash
$ bundle install
$ rake db:migrate
$ rake db:seed
$ rails s
```

Running the seeds is importante because the tag_types

And you have the HtmlParser running locally

## Using API

The API has 2 endpoints, one for parsing urls and other for showing previously indexed urls

We use swagger to auto document the api endpoints. To use swagger:

- Go to http(s)://#{url}/api/swagger.
- In the explore field put http(s)://url/swagger_doc

![alt tag](https://cloud.githubusercontent.com/assets/5366444/17562010/00548f30-5ee6-11e6-94e1-c528aca98113.png)


From Swagger you can interact with the API:

Indexing pages:

![alt tag](https://cloud.githubusercontent.com/assets/5366444/17561932/9d368656-5ee5-11e6-8c8d-fb2a5974f6cc.png)


Checking existing pages:


![alt tag](https://cloud.githubusercontent.com/assets/5366444/17561934/9fdfe71c-5ee5-11e6-8a86-026b506ea8bb.png)


## Unit Testing

Unit testing is done using:
* Minitest as rails default framework for Testing
* FactoryGirl to simplify models representation
* Simplecov for coverage.

To run tests:

rake db:test:prepare
rake db:seed RAILS_ENV=test   # this to preload the tag types defined as default, a, h1, h2, h3
rake test


## Coverage, Breakeman and Rubycritic

### Coverage

Currently we have a coverage of 97.67% as shown below:

![alt tag](https://cloud.githubusercontent.com/assets/5366444/17561922/857b5cda-5ee5-11e6-84b0-2fed33287d6f.png)


Go to /coverage folder and open index.html to visualize it.

### rubycritic

We use Rubycritic as a tool for checking our code quality. Current Score:

![alt tag](https://cloud.githubusercontent.com/assets/5366444/17561897/6c4bbe94-5ee5-11e6-8228-64bf2167930a.png)

You can run inside the project:


```bash
$ rubycritic
```

To generate the rubycritic folder in the project and check index.html inside that folder.


You can read more here:

https://gorillalogic.com/blog/best-practices/automatic-and-static-ruby-code-analyzer-pt-1/


### brakeman

We use brakeman security scanner to check everything related with security is ok.

![alt tag](https://cloud.githubusercontent.com/assets/5366444/17561880/5a88cf12-5ee5-11e6-807c-1b4d0e84319f.png)

You can run inside the project:


```bash
$ brakeman -o output.html
```

And find inside the project output.html with the result of the scanner.
