require './spec/spec_helper.rb'
require './spec/logger.rb'

describe "google_4" do
  
  it "open home page" do
    @driver.get "https://www.google.com/"
    @driver.find_element(id: 'lst-ib').send_keys "SABRINA"
    @driver.find_element(id: 'lst-ib').send_keys :tab
    @driver.find_element(name: 'btnK').click
    sleep 5
    p @driver.find_element(xpath: '//h3/a').text
  end
  
  it "print url" do
    @driver.get "https://www.google.com/"
    @driver.find_element(id: 'lst-ib').send_keys "ANNA"
    @driver.find_element(id: 'lst-ib').send_keys :tab
    @driver.find_element(name: 'btnK').click
    sleep 5
    p @driver.find_element(xpath: '//h3/a/ttt').text
  end
  
end




