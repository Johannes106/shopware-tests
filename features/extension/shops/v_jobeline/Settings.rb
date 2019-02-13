#v_jobeline
class Settings
  attr_accessor :url_checkout_confirm, :url_add_comand, :urlHttp, :urlHttps, :urlBackend, :baby_steps

  def initialize
    if ENV['SYSTEM'] == "int"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then    'http://int.jobeline.com/de-de/'
        when (/at/) then    'http://int.jobeline.com/at-de/'
        when (/ch/) then    'http://int.jobeline.com/ch-de/'
        when (/ch-fr/) then 'http://int.jobeline.com/ch-fr/'
        when (/it/) then    'http://int.jobeline.com/it-it/'
        when (/fr/) then    'http://int.jobeline.com/fr-fr/'
        when (/no/) then    'http://int.jobeline.com/no-no/'
        when (/se/) then    'http://int.jobeline.com/se-se/'
        when (/nl/) then    'http://int.jobeline.com/nl-nl/'
        when (/be/) then    'http://int.jobeline.com/be-fr/'
        when (/es/) then    'http://int.jobeline.com/es-es/'
        when (/en/) then    'http://int.jobeline.com/en-us/'
      end
      @urlHttps = case ENV['COUNTRY']#Important:write 's
        when (/de/) then    'http://int.jobeline.com/de-de/'
        when (/at/) then    'http://int.jobeline.com/at-de/'
        when (/ch/) then    'http://int.jobeline.com/ch-de/'
        when (/ch-fr/) then 'http://int.jobeline.com/ch-fr/'
        when (/it/) then    'http://int.jobeline.com/it-it/'
        when (/fr/) then    'http://int.jobeline.com/fr-fr/'
        when (/no/) then    'http://int.jobeline.com/no-no/'
        when (/se/) then    'http://int.jobeline.com/se-se/'
        when (/nl/) then    'http://int.jobeline.com/nl-nl/'
        when (/be/) then    'http://int.jobeline.com/be-fr/'
        when (/es/) then    'http://int.jobeline.com/es-es/'
        when (/en/) then    'http://int.jobeline.com/en-us/'
      end
      @urlBackend = 'https://int.jobeline.com/'
    end

    if ENV['SYSTEM'] == "stage"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then    'http://stage.jobeline.com/de-de/'
        when (/at/) then    'http://stage.jobeline.com/at-de/'
        when (/ch/) then    'http://stage.jobeline.com/ch-de/'
        when (/ch-fr/) then 'http://stage.jobeline.com/ch-fr/'
        when (/it/) then    'http://stage.jobeline.com/it-it/'
        when (/fr/) then    'http://stage.jobeline.com/fr-fr/'
        when (/no/) then    'http://stage.jobeline.com/no-no/'
        when (/se/) then    'http://stage.jobeline.com/se-se/'
        when (/nl/) then    'http://stage.jobeline.com/nl-nl/'
        when (/be/) then    'http://stage.jobeline.com/be-fr/'
        when (/es/) then    'http://stage.jobeline.com/es-es/'
        when (/en/) then    'http://stage.jobeline.com/en-us/'
      end
      @urlHttps = case ENV['COUNTRY']#Important:write 's
        when (/de/) then    'https://stage.jobeline.com/de-de/'
        when (/at/) then    'https://stage.jobeline.com/at-de/'
        when (/ch/) then    'https://stage.jobeline.com/ch-de/'
        when (/ch-fr/) then 'https://stage.jobeline.com/ch-fr/'
        when (/it/) then    'https://stage.jobeline.com/it-it/'
        when (/fr/) then    'https://stage.jobeline.com/fr-fr/'
        when (/no/) then    'https://stage.jobeline.com/no-no/'
        when (/se/) then    'https://stage.jobeline.com/se-se/'
        when (/nl/) then    'https://stage.jobeline.com/nl-nl/'
        when (/be/) then    'https://stage.jobeline.com/be-fr/'
        when (/es/) then    'https://stage.jobeline.com/es-es/'
        when (/en/) then    'https://stage.jobeline.com/en-us/'
      end
      @urlBackend = 'https://stage.jobeline.com/'
    end

    if ENV['SYSTEM'] == "live"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then    'http://www.jobeline.com/de-de/'
        when (/at/) then    'http://www.jobeline.com/at-de/'
        when (/ch/) then    'http://www.jobeline.com/ch-de/'
        when (/ch-fr/) then 'http://www.jobeline.com/ch-fr/'
        when (/it/) then    'http://www.jobeline.com/it-it/'
        when (/fr/) then    'http://www.jobeline.com/fr-fr/'
        when (/no/) then    'http://www.jobeline.com/no-no/'
        when (/se/) then    'http://www.jobeline.com/se-se/'
        when (/nl/) then    'http://www.jobeline.com/nl-nl/'
        when (/be/) then    'http://www.jobeline.com/be-fr/'
        when (/es/) then    'http://www.jobeline.com/es-es/'
        when (/en/) then    'http://www.jobeline.com/en-us/'
      end
      @urlHttps = case ENV['COUNTRY']
        when (/de/) then    'https://www.jobeline.com/de-de/'
        when (/at/) then    'https://www.jobeline.com/at-de/'
        when (/ch/) then    'https://www.jobeline.com/ch-de/'
        when (/ch-fr/) then 'https://www.jobeline.com/ch-fr/'
        when (/it/) then    'https://www.jobeline.com/it-it/'
        when (/fr/) then    'https://www.jobeline.com/fr-fr/'
        when (/no/) then    'https://www.jobeline.com/no-no/'
        when (/se/) then    'https://www.jobeline.com/se-se/'
        when (/nl/) then    'https://www.jobeline.com/nl-nl/'
        when (/be/) then    'https://www.jobeline.com/be-fr/'
        when (/es/) then    'https://www.jobeline.com/es-es/'
        when (/en/) then    'https://www.jobeline.com/en-us/'
      end
      @urlBackend = 'https://www.jobeline.com/'
    end
    @url_add_comand = 'direktbestellen'
    @baby_steps = true
  end
end
