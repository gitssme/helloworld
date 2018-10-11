require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def run
	setup
	yield
	teardown
end

def setup
	@browser = Selenium::WebDriver.for :firefox
end

def teardown
	@browser.quit
end

run do
	@browser.get('http://google.com');
	search = @browser.find_element(name: 'q')
	search.send_keys "test automation is awesome", :return
	wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
        wait.until { @browser.title.include? "test automation is awesome" }
	puts @browser.title
end

