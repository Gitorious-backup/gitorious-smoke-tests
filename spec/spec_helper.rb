require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
require 'securerandom'

host = ENV['HOST'] || 'http://vagrant:3000'

Capybara.default_driver = :poltergeist
Capybara.run_server = false
Capybara.app_host = host

Capybara.save_and_open_page_path = "tmp"
