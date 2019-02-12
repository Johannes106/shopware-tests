#pulsiva
class Settings
  attr_accessor :url_checkout_confirm, :url_add_comand, :urlHttp, :urlHttps, :urlBackend, :baby_steps

  def initialize
    if ENV['SYSTEM'] == "int"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then    'http://int.pulsiva.com/de-de/'
        when (/at/) then    'http://int.pulsiva.com/at-de/'
        when (/ch/) then    'http://int.pulsiva.com/ch-de/'
        when (/ch-fr/) then 'http://int.pulsiva.com/ch-fr/'
        when (/it/) then    'http://int.pulsiva.com/it-it/'
        when (/fr/) then    'http://int.pulsiva.com/fr-fr/'
        when (/no/) then    'http://int.pulsiva.com/no-no/'
        when (/se/) then    'http://int.pulsiva.com/se-se/'
        when (/nl/) then    'http://int.pulsiva.com/nl-nl/'
        when (/es/) then    'http://int.pulsiva.com/es-es/'
      end
      @urlHttps = case ENV['COUNTRY']#Important:write 's
        when (/de/) then    'https://int.pulsiva.com/de-de/'
        when (/at/) then    'https://int.pulsiva.com/at-de/'
        when (/ch/) then    'https://int.pulsiva.com/ch-de/'
        when (/ch-fr/) then 'https://int.pulsiva.com/ch-fr/'
        when (/it/) then    'https://int.pulsiva.com/it-it/'
        when (/fr/) then    'https://int.pulsiva.com/fr-fr/'
        when (/no/) then    'https://int.pulsiva.com/no-no/'
        when (/se/) then    'https://int.pulsiva.com/se-se/'
        when (/nl/) then    'https://int.pulsiva.com/nl-nl/'
        when (/es/) then    'https://int.pulsiva.com/es-es/'
      end
      @urlBackend = 'http://int.pulsiva.com/'
    end

    if ENV['SYSTEM'] == "stage"
      @urlHttp = case ENV['COUNTRY']
      when (/de/) then    'http://stage.pulsiva.com/de-de/'
      when (/at/) then    'http://stage.pulsiva.com/at-de/'
      when (/ch/) then    'http://stage.pulsiva.com/ch-de/'
      when (/ch-fr/) then 'http://stage.pulsiva.com/ch-fr/'
      when (/it/) then    'http://stage.pulsiva.com/it-it/'
      when (/fr/) then    'http://stage.pulsiva.com/fr-fr/'
      when (/no/) then    'http://stage.pulsiva.com/no-no/'
      when (/se/) then    'http://stage.pulsiva.com/se-se/'
      when (/nl/) then    'http://stage.pulsiva.com/nl-nl/'
      when (/es/) then    'http://stage.pulsiva.com/es-es/'
      end
      @urlHttps = case ENV['COUNTRY']#Important:write 's
      when (/de/) then    'https://stage.pulsiva.com/de-de/'
      when (/at/) then    'https://stage.pulsiva.com/at-de/'
      when (/ch/) then    'https://stage.pulsiva.com/ch-de/'
      when (/ch-fr/) then 'https://stage.pulsiva.com/ch-fr/'
      when (/it/) then    'https://stage.pulsiva.com/it-it/'
      when (/fr/) then    'https://stage.pulsiva.com/fr-fr/'
      when (/no/) then    'https://stage.pulsiva.com/no-no/'
      when (/se/) then    'https://stage.pulsiva.com/se-se/'
      when (/nl/) then    'https://stage.pulsiva.com/nl-nl/'
      when (/es/) then    'https://stage.pulsiva.com/es-es/'
      end
      @urlBackend = 'http://stage.pulsiva.com/'
    end

    if ENV['SYSTEM'] == "live"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then 'http://www.pulsiva.com/de-de/'
        when (/at/) then 'http://www.pulsiva.com/at-de/'
        when (/ch/) then 'http://www.pulsiva.com/ch-de/'
        when (/ch-fr/) then 'http://www.pulsiva.com/ch-fr/'
        when (/it/) then 'http://www.pulsiva.com/it-it/'
        when (/fr/) then 'http://www.pulsiva.com/fr-fr/'
        when (/no/) then 'http://www.pulsiva.com/no-no/'
        when (/se/) then 'http://www.pulsiva.com/se-se/'
        when (/nl/) then 'http://www.pulsiva.com/nl-nl/'
        when (/es/) then 'http://www.pulsiva.com/es-es/'
      end
      @urlHttps = case ENV['COUNTRY']
        when (/de/) then 'https://www.pulsiva.com/de-de/'
        when (/at/) then 'https://www.pulsiva.com/at-de/'
        when (/ch/) then 'https://www.pulsiva.com/ch-de/'
        when (/ch-fr/) then 'https://www.pulsiva.com/ch-fr/'
        when (/it/) then 'https://www.pulsiva.com/it-it/'
        when (/fr/) then 'https://www.pulsiva.com/fr-fr/'
        when (/no/) then 'https://www.pulsiva.com/no-no/'
        when (/se/) then 'https://www.pulsiva.com/se-se/'
        when (/nl/) then 'https://www.pulsiva.com/nl-nl/'
        when (/es/) then 'https://www.pulsiva.com/es-es/'
      end
      @urlBackend = 'https://www.pulsiva.com/'
      @url_add_comand = 'direktbestellen'
      @baby_steps = true
    end
  end
end
