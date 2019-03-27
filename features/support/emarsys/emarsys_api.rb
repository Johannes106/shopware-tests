require 'emarsys'
require_relative "emarsys_auth.rb"

class Emarsys_api
  attr_accessor :mailaddress

  def initialize()
    @mailaddress = mailaddress
  end

  def exists_mailaddress_in_db?
    mailaddress = @mailaddress
    #Check: if a mailaddress exists in the db result is some text it not exist result=false
    result = false
    request = Emarsys::Contact.search(key_id: 'email', key_values: ["#{mailaddress}"], fields: [3])
      #if request=0 = no mailadress exists
    if (request.code.nonzero?)
      puts "request.code:#{request.code}"
      puts "OK, mail is registered"
      result=true
    else
      puts "mailaddress is not in DB"
    end
    return result
    # end
  end

  def delete_mailaddress
    res = exists_mailaddress_in_db?
    if (res==true)
      puts res
      #Emarsys::Contact.delete(key_id: 'email', key_value: "#{mailaddress}")
      puts "#{mailaddress} is deleted"
    end
  end
end
