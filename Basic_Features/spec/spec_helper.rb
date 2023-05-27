require 'capybara/rspec'
require 'selenium-webdriver'

# Capybara.register_driver :remote_chrome do |app|
#   options = Selenium::WebDriver::Options.chrome
#
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :remote,
#     url: 'http://localhost:4444/wd/hub',
#     options: options
#   )
# end
#
# Capybara.register_driver :remote_firefox do |app|
#   options = Selenium::WebDriver::Options.firefox
#
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :remote,
#     url: 'http://localhost:4444/wd/hub',
#     options: options
#   )
# end

RSpec.configure do |config|
  config.formatter = :documentation
  config.include Capybara::DSL
end


Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :remote_browser
  config.app_host = 'https://the-internet.herokuapp.com'
  config.javascript_driver = :remote_browser
  config.default_max_wait_time = 10
end


module Grid
  class TestRunner
    BROWSERS = %w[firefox chrome].freeze

    def run
      BROWSERS.each do |browser|
        setUp(browser)
        yield
      end
    end

    def setUp(browser)
      puts "\n\n############################"
      puts "Starting #{browser.capitalize} test run..."
      puts "############################\n\n"

      Capybara.register_driver :remote_browser do |app|
        options = Selenium::WebDriver::Options.send(browser.to_sym)

        Capybara::Selenium::Driver.new(
          app,
          browser: :remote,
          url: 'http://localhost:4444/wd/hub',
          options: options
        )
      end
    end
  end
end

test_runner = Grid::TestRunner.new
test_runner.run do
  RSpec::Core::Runner.run ['spec']
  RSpec.clear_examples
end
