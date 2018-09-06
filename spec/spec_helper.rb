require 'selenium-webdriver'
require 'rspec'
require 'rspec/expectations'
require 'rspec/autorun'

RSpec.configure do |config|

  config.before(:each) do
    # @driver = Selenium::WebDriver.for :chrome
    begin
      hub_url = "http://localhost:4444/wd/hub"
      browser = "chrome"
      @driver = Selenium::WebDriver.for(:remote, url: "#{hub_url}", desired_capabilities: browser.to_sym)
      # $logger = LoggerS.new(@driver.session_id)
    rescue Exception => e
      p e
    end
  end

  config.after(:each) do
    @driver.quit
  end

end