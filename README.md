### About
This is a simple application with a Capybara test you can run to see data auto-magically entered through your browser.

### Setup

These gems were added to the `test` group support Capybara

````
group :test do
  gem 'selenium-webdriver'
  gem 'capybara-webkit'
  gem 'capybara'
end
````

`test_helper.rb` was also modifed to include

````
require 'capybara/rails'

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end
````

`manage_users_test.rb` extends `ActionDispatch::IntegrationTest`, so it is able to use the Capybara DSL.

### Drivers

You can swap the driver by uncommenting your driver of choice in the setup block of `manage_users_test.rb`

`:selenium` is selected by default, and with this driver you can actually see Firefox opening and running your test (optionally slowed down by carefully placed `sleep` statements). **Just make sure you have Firefox installed to use it.**

The `:webkit` driver runs faster because it uses a headless browser. **In order to use it, you'll need to install qt-5** [as described here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit).

### Usage

Once you have the dependencies installed for your drivers, you can run the sample test with `bin/rake test test/integration/manage_users_test.rb`
