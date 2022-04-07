require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

# Bundler.setup(:default)
# Bundler.require

Capybara.configure do |config|

  config.app_host = 'https://the-internet.herokuapp.com'
  config.run_server = false

  config.default_driver = :remote_browser
  config.javascript_driver = :remote_browser

  config.default_max_wait_time = 10
end

# Capybara.default_driver = :selenium_chrome

RSpec.configure do |config|
  config.formatter = :documentation
  config.include Capybara::DSL
end

module Grid
  class TestRunner
    BROWSERS = ['firefox', 'chrome'].freeze

    def run
      BROWSERS.each do |browser|
        setup(browser)
        yield
      end
    end

    def setup(browser)
      puts "\n\n############################"
      puts "Starting #{browser.capitalize} test run..."
      puts "############################\n\n"

      Capybara.register_driver :remote_browser do |app|
        capabilities = Selenium::WebDriver::Remote::Capabilities.send(browser.to_sym)

        Capybara::Selenium::Driver.new(
          app,
          browser: browser.to_sym,
          url: "http://localhost:4444/wd/hub",
          desired_capabilities: capabilities
        )
      end
    end
  end
end

testrunner = Grid::TestRunner.new
testrunner.run do
  RSpec::Core::Runner.run ['spec']
  RSpec.clear_examples
end