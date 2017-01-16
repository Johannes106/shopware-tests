#hotelwaesche
class Settings
  attr_accessor :url_checkout_confirm, :url_add_comand, :urlHttp, :urlHttps, :urlBackend, :baby_steps
  
  def initialize
    if ENV['SYSTEM'] == "int"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then 'http://int.hotelwaesche.de/'
        when (/at/) then 'http://int.hotelwaesche.at/'
        when (/ch/) then 'http://int.erwinmueller.ch/ch-de/'
        when (/ch-fr/) then 'http://int.erwinmueller.ch/ch-fr/'
      end
      @urlHttps = case ENV['COUNTRY']#Important:write 's
        when (/de/) then 'https://int.hotelwaesche.de/'
        when (/at/) then 'https://int.hotelwaesche.at/'
        when (/ch/) then 'https://int.erwinmueller.ch/ch-de/'
        when (/ch-fr/) then 'https://int.erwinmueller.ch/ch-fr/'
      end
      @urlBackend = 'http://int.hotelwaesche.de/'
    end
    
    if ENV['SYSTEM'] == "live"
      @urlHttp = case ENV['COUNTRY']        
        when (/de/) then 'http://www.hotelwaesche.de/'
        when (/at/) then 'http://www.hotelwaesche.at/'
        when (/ch/) then 'http://www.erwinmueller.ch/ch-de/'
        when (/ch-fr/) then 'http://www.erwinmueller.ch/ch-fr/'
      end
      @urlHttps = case ENV['COUNTRY']
        when (/de/) then 'https://www.hotelwaesche.de/'
        when (/at/) then 'https://www.hotelwaesche.at/'
        when (/ch/) then 'https://www.erwinmueller.ch/ch-de/'
        when (/ch-fr/) then 'https://www.erwinmueller.ch/ch-fr/'
      end
      @urlBackend = 'https://www.hotelwaesche.de/'
    end
    @url_add_comand = 'direktbestellen'
    @baby_steps = true
  end
end