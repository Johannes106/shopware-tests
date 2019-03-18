require 'emarsys'
require_relative "emarsys_auth.rb"

class Emarsys_api
  attr_reader :mailaddress

  def initialize(mailaddress)
    @mailaddress = mailaddress
  end

  def exists_mailaddress_in_db?
    mailaddress = @mailaddress
    #Check: if a mailaddress exists in the db
    result = Emarsys::Contact.search(key_id: 'email', key_values: ["#{mailaddress}"], fields: [3])
    if (result==true)
      puts "OK, mail is registered"
    else
      abort ("mailaddress is not in DB")
    end
    return result
  end

  def delete_mailaddress
    res = exists_mailaddress_in_db?
    puts "res: #{res.data['result']}"
    if (res==true)
      Emarsys::Contact.delete(key_id: 'email', key_value: "#{mailaddress}")
    end
  end
end
