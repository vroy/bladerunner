# Bladerunner

Edit SQL files in your Rails project with your favourite editor; View results in your browser in realtime as your files are saved.

I've never found an SQL editor/runner that I liked for PostgreSQL, so why not profit from Rails and an active connection to your database to solve this problem? Write SQL files in `bladerunner/*.sql` and open your browser to the mounted path to see your queries and run them.

Quick little screencast demo of the functionality: http://www.youtube.com/watch?v=r1858nYdQQk

**WARNING:** Bladerunner does NOT prevent anything nasty from happening, operate at your own risk.

## Installation & Getting Started

Add bladerunner to your Gemfile:

```ruby
gem "bladerunner"
```

Add this to your `config/routes.rb` file to mount Bladerunner in your Rails app in development:

```ruby
if Rails.env.development?
  mount Bladerunner::Engine => "/bladerunner"
end
```

Create your first query:

```sh
mkdir bladerunner/
echo "select * from schema_migrations" >> bladerunner/schema-migrations.sql
open http://localhost:3000/bladerunner/run?filename=schema-migrations.sql
```

Don't forget to add `bladerunner/` to your `.gitignore` file if you don't want to share these queries.

```sh
echo "bladerunner/" >> .gitignore
```

## Notes

Tested on:

* Ruby 2.0.0p247 (MRI)
* Rails 3.2.13


## Feature ideas

* Refactor & move logic out of controller.
* Improved realtime support (vs. the current polling).
* Ability to run ruby code the same way.
* Some tests
* Scrolling table support for results (sticky header)
