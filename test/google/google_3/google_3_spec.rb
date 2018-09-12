require './spec/spec_helper.rb'

describe "google_3" do
  
  it "open home page" do
    @driver.get "https://www.google.com/"
    @driver.find_element(id: 'lst-ib').send_keys "SHEN"
    @driver.find_element(id: 'lst-ib').send_keys :tab
    @driver.find_element(name: 'btnK').click
    sleep 5
    # make this step fail
    p @driver.find_element(xpath: '//h3/a/ttt').text
  end
  
end