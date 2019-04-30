require_relative "shopware_authentication.rb"
require_relative "shopware_functions.rb"
require 'httparty'
require 'json'
# Use the class methods to get down to business quickly
class ShopwareApi
  include HTTParty
  include ShopwareAuthentication
  include ShopwareFunctions

  # set a variable to true and so i can check if the action was successful
  # attr_accessor :$apiActionsSuccessful
  #
  # def initialize()
   $apiActionsSuccessful = true
  # end

  #for int use htaccess-data too
  if (ENV['SYSTEM'] == 'int')
    puts "Timeout of HTTParty is set to 20"
    default_timeout 20
  else
    default_timeout 10
  end

  #file
  #out_file = File.new("httpactions.log", "w")
  #logger
  #debug_output out_file

  #crud comands ----------------------------------------------------
  #create
  def postData(url, options)
    response_data = handle_timeouts{self.class.post(url, options)}
    if !response_data.success? || !response_data
      puts ">> ERROR: post-action failed"
      puts "data: #{options}"
      puts "Error Msg: #{response_data}"
      raise(ScriptError, "Error: post failed!")
      exit
    end
  end

  #read
  def readData(url)
    options = getDigest()
    sleep 2
    response_data = self.class.get(url, options)#handle_timeouts{self.class.get(url, options)}
    if response_data.success?
      response_data
    else
      puts ">>>>>>>>> Can not connect"
      puts "Errortxt: #{response_data}"
      raise(ScriptError, "Error: read failed!")
    end
    response_data_json = response_data.parsed_response
    return response_data_json
  end
  #update
  def updateData(url, options)
    begin
      response_data = self.class.put(url, options)#handle_timeouts{self.class.put(url, options)}
      if !response_data.success?
        puts ">> ERROR: update failed"
        puts "options: #{options}"
        puts "Error Msg: #{response_data}"
        raise(ScriptError, "Error: update failed!")
      end
    rescue => e
      puts ">>>>>>>>> API: put action failed -> set value of $apiActionsSuccessful to false"
      $apiActionsSuccessful = false
    end
  end
  #delete
  def deleteData(url)
    options = getDigest()
    sleep 2
    if ($apiActionsSuccessful == true)
      response_data = self.class.delete(url, options)#handle_timeouts{self.class.delete(url, options)}
      if response_data.success?
        response_data
      else
        puts ">>>>>>>>> Can not connect"
        puts "Errortxt: #{response_data}"
        raise(ScriptError, "Error: delete failed!")
      end
    else
      puts ">>> I do not delete because something has failed"
    end
  end

  #catch exception
  def handle_timeouts(&block)
    max_retries = 3
    times_retried = 0
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout => e
      puts "Timeout"
      puts "#{e}"
      puts "----> exit"
      exit
    rescue SocketError => e
      puts "incorrect URL"
      puts "#{e}"
      if times_retried < max_retries
        times_retried += 1
        puts "Failed to <do the thing>, retry #{times_retried}/#{max_retries}"
        sleep rand (1..8)
        retry
      end
    end
  end

end
