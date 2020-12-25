require 'selenium-webdriver'
require 'rspec'
require 'capybara/cucumber'
require 'capybara'
require 'pry'
require 'faker'
require 'site_prism'
require 'report_builder'


case ENV['BROWSER']
when 'firefox'
  @driver = :selenium
when 'chrome'
  @driver = :selenium_chrome
when 'headless' 
  @driver = :selenium_chrome_headless
else
  puts 'Navegador não encontrado!'
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = 'http://www.inmrobo.tk'
  config.default_max_wait_time = 5
end
