# require 'rest-client'
# require 'json'
# 
# class LoggerS
# 
  # def initialize(session_id)
    # @session_id = session_id
  # end
# 
  # def latest
    # parse(fetch).last
  # end
# 
  # private
# 
  # def fetch
    # p "sessionid ======> #{@session_id}"
    # sleep 60
    # RestClient.post(
      # "http://localhost:4444/wd/hub/session/#{@session_id}/log",
      # {"type" => "client"}.to_json,
      # {content_type: :json,
      # accept: :json}
    # )
  # end
# 
  # def parse(input)
    # logs = JSON.parse(input)
    # messages = []
    # # if logs["value"].length == 1
      # # msg = logs["value"]["message"]
      # # p "msg===>"+msg
      # # unless msg.include? "session:" or msg.include? "fetching logs" or msg.include? "execute script"
        # # messages << "sabrina testing msg"
        # # messages << msg.scan(/handle(.*)$/)[-1][-1]
      # # end
    # # end
    # p "logger ===> "
    # p logs
    # p "logger value ===> "+logs["value"]
    # logs["value"].each do |entry|
      # msg = entry["message"]
      # p "======debugging========"
      # p "msg ====> #{msg}"
      # p "======debugging========"
      # unless msg.include? "session:" or
        # msg.include? "fetching logs" or
          # msg.include? "execute script"
            # messages << msg.scan(/handle(.*)$/)[-1][-1]
      # end
    # end
    # p "messages====>"+messages
    # messages
  # end
# 
# end