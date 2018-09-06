require 'rspec'
require 'rspec/expectations'
require 'rspec/autorun'
require 'selenium-webdriver'
require 'yaml'
# require "optparse"


Dir["#{File.dirname(__FILE__)}/../core_frame/*/*.rb"].each {|file| require file if file!="./"<<__FILE__}



script_path="demo_1/google_1"

#get the paramaters from config.yml for each test plan into $parameters
$parameters=YAML.load(File.open("#{File.dirname(__FILE__)}/#{script_path}/config.yml"))






result_path = "google_search_demo_#{Time.now.strftime("%Y%m%d_%H%M%S")}"
ARGV.push '-fh'
ARGV.push '-o'
ARGV.push "../output/test_results/#{result_path}.htm"
puts "You can find test result in: ../output/test_results/#{result_path}.htm"
folder_path = File.join(Dir.getwd.split("test")[0],"output")
#init output folders
Dir.mkdir folder_path if not File.exist? folder_path
10.times do |i|
  begin
    if File.exist? folder_path
      path = File.join(folder_path,"screenshots")
      Dir.mkdir path if not File.exist? path
      path = File.join(folder_path,"test_results")
      Dir.mkdir path if not File.exist? path
      path = File.join(folder_path,"log")
      Dir.mkdir path if not File.exist? path
      break
    end
    sleep 1
    Common.logger_error "Create folder failed in 10 seconds with #{folder_path}" if i>=9
  rescue =>e
  end
end





describe "google_search_demo_spec" do
  
  before(:all){
    # new driver and browser
    p "======> before all"
    WebDriver.start_browser
  }
  
  before(:each){
   p "======> before each"
  }
  
  
  
  
  
  
  
  
  after(:all){
    # close driver
    WebDriver.quit_browser
  }
  
  Dir[File.dirname(__FILE__) + "/#{script_path}/*.rb"].each {|file| require file}
  $parameters['actions'].split(',').each {|m| send m.strip.to_sym}
end
