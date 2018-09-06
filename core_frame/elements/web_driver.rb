class WebDriver
  class << self
  
    def start_browser
      @driver = Selenium::WebDriver.for :chrome
    end
    
    def restart_browser
      @driver.quit unless @driver.nil?
      start_browser
    end
    
    def quit_browser
      @driver.quit unless @driver.nil?
    end
    
    def close_current_window
      $drive.close unless @driver.nil?
    end
    
    def navigate_to_url(url)
      begin
        LoggerInfo.logger_step "Execute - Navigate to URL #{url} - success."
        @driver.get url
      rescue Timeout::Error
        LoggerInfo.logger_info "Execute - Navigate to URL #{url} - warnning. get Timeout::Error "
      end
    end
    
    def start_remote_browser(browser, hub_url)
      begin
        @driver = Selenium::WebDriver.for(:remote, url: '#{hub_url}', desired_capabilities: browser.to_sym)
      rescue Exception => e
        p e
      end
        
    end
    
  
  end
end