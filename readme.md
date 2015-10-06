#Testing in Rails

This application can serve as an example of how to integrate and write unit (and acceptance) tests for a Rails application.

###Setup

* Use `rspec-rails` to start testing in your Rails app using Rspec.


Add `rspec-rails` to **both** the `:development` and `:test` groups in the
`Gemfile`:

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end
```

Download and install by running:

```
bundle install
```

Initialize the `spec/` directory (where specs will reside) with:

```
rails generate rspec:install
```

This adds the following files which are used for configuration:

- `.rspec`
- `spec/spec_helper.rb`
- `spec/rails_helper.rb`

Check the comments in each file for more information.

Use the `rspec` command in the root of the application to run the specs, if that doesn't work try `bundle exec rspec`.

By default the above will run all `_spec.rb` files in the `spec` directory. For
more details about this see the [RSpec spec file
docs](https://www.relishapp.com/rspec/rspec-core/docs/spec-files).

To run only a subset of these specs use the following command:

```
# Run only model specs
rspec spec/models

# Run only specs for AccountsController
rspec spec/controllers/accounts_controller_spec.rb
```

###Generators

Once installed, RSpec will generate spec files instead of Test::Unit test files when commands like `rails generate model` and `rails generate controller` are used. If the model you want to test already exists, you can invoke RSpec generators independently by running `rails generate rspec:model <name_of_model>` will generate a model spec. For more information, see [list of all generators](https://www.relishapp.com/rspec/rspec-rails/docs/generators).

###Dependencies

In this example `shoulda` matchers are used to help make the tests more readable and so is `factory-girl`, which helps create valid model instances to test in order to maintain flexible and DRY tests. Keep in mind that neither of these gems are necessary, just a convenience in making the tests more readable. If you want to do the same, you'll need both of them.

```ruby
group :development, :test do
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails'
end
```

Finally add `require 'shoulda/matchers'` to `rails-helper.rb` to require shoulda matchers.

###Examples

* Look inside this project's `/spec` directory to see some example tests. Pay particular attention to the `/spec/models` directory as model tests, aka unit tests, is the first step in a testing an application.
* Here are more [example model tests](https://www.relishapp.com/rspec/rspec-rails/docs/model-specs) from the Rspec docs.

###Other Potential Questions

* What is a [factory](https://github.com/thoughtbot/factory_girl_rails)?
* What is [BDD](http://guide.agilealliance.org/guide/bdd.html)?
* What is [capybara](https://github.com/jnicklas/capybara)?
* How do I [use Capybara](notes/bdd-capybara.md) to write BDD tests?
