require './spec/spec_helper.rb'

describe "baidu_2" do
  
  it "open home page" do
    @driver.get "https://www.google.com/"
    @driver.find_element(id: 'lst-ib').send_keys "YANG"
    @driver.find_element(id: 'lst-ib').send_keys :tab
    @driver.find_element(name: 'btnK').click
    sleep 5
    p @driver.find_element(xpath: '//h3/a').text
  end
  
end