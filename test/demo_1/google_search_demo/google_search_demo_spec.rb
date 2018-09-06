def google_search_demo_spec
  
  it "open home page" do
    WebDriver.restart_browser
    WebDriver.navigate_to_url "https://www.google.com/"
  end
  
  it "search and go" do
    GoogleHome::InptSearch.new.wait_element_present
    GoogleHome::InptSearch.new.input "selenium"
    GoogleHome::BtnGoogleSearch.new.click
    
  end
  
  it "result list" do
    GoogleList::LnkListByIndex.new.wait_element_present
    puts "=================================="
    (1..9).each do |i|
      GoogleList::LnkListByIndex.new(i).get_text if GoogleList::LnkListByIndex.new(i).exist?
    end
    puts "=================================="
  end
  
end