#this sample shows how to use the restapi of shopware with ruby
require_relative 'shopware_api'
username = ARGV[0]
puts "username:#{username}"
apikey = ARGV[1]
puts "apikey:#{apikey}"
husername = ARGV[2]
puts "husername:#{husername}"
hapikey = ARGV[3]
puts "hapikey:#{hapikey}"
@urlname = ARGV[4]
urlname = @urlname
puts "urlname:#{urlname}"

#shopware_user0 = ShopwareApi.new()#husername, hapikey)
#shopware_user0.setBasic(husername, hapikey, urlname)
#shopware_user0.getWholeData('Customers')
shopware_user1 = ShopwareApi.new()#husername, hapikey)
shopware_user1.setDigest(username, apikey, urlname)
#api:
#shopware_user1.deleteCustomerByMail("testmail_pde@test.de")
shopware_user1.updateOrderStatusForMail("email", "testmail_pde@test.de")
#shopware_user1.getWholeData('Orders')