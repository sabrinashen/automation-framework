require 'logger'
require 'fileutils'

class LoggerInfo
  class << self
    
    def instance
      logger_path = File.join(File.dirname(__FILE__),"../..","output","log","automation.log")
      Logger.new logger_path
    end
    
    def logger_error(message)
      puts "ERROR- #{message}"
      # $result = "Failed"
      # current_url = (@driver!=nil && @driver.current_url.include?("http")) ? "#{@driver.current_url}\n" : nil
      $logger.error message
      # $errormessage=$errormessage <<timestamp<<" -- #{current_url}#{message}\n"
      # raise message
      # false
    end
    
    def logger_info(message)
      puts "INFO - #{message}"
      $logger.info message
    end
    
    def logger_step(message)
      p $logger
      puts "STEP - #{message}"
      $logger.info message
    end
    
  end
end

$logger = LoggerInfo.instance
