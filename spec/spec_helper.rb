require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
require 'securerandom'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

host = ENV['HOST'] || 'http://vagrant:3000'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--ignore-ssl-errors=yes'])
end

Capybara.default_driver = :poltergeist
Capybara.run_server = false
Capybara.app_host = host
Capybara.default_wait_time = 5

Capybara.save_and_open_page_path = "tmp"
