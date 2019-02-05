#hw_jobeline
class Settings
  attr_accessor :url_checkout_confirm, :url_add_comand, :urlHttp, :urlHttps, :urlBackend, :baby_steps

  def initialize
    if ENV['SYSTEM'] == "int"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then 'http://int.jobeline.de/'
        when (/at/) then 'http://int.jobeline.at/'
        when (/ch/) then 'http://int.jobeline.ch/ch-de/'
        when (/ch-fr/) then 'http://int.jobeline.ch/ch-fr/'
      end
      @urlHttps = case ENV['COUNTRY']#Important:write 's
        when (/de/) then 'http://int.jobeline.de/'
        when (/at/) then 'http://int.jobeline.at/'
        when (/ch/) then 'http://int.jobeline.ch/ch-de/'
        when (/fr/) then 'http://int.jobeline.ch/ch-fr/'
      end
      @urlBackend = 'http://int.jobeline.de/'
    end

    if ENV['SYSTEM'] == "stage"
      @urlHttp = case ENV['COUNTRY']
      when (/de/) then    'http://stage.jobeline.de/'
      when (/at/) then    'http://stage.jobeline.at/'
      when (/ch/) then    'http://stage.jobeline.ch/ch-de/'
      when (/ch-fr/) then 'http://stage.jobeline.ch/ch-fr/'
      end
      @urlHttps = case ENV['COUNTRY']#Important:write 's
      when (/de/) then    'http://stage.jobeline.de/'
      when (/at/) then    'http://stage.jobeline.at/'
      when (/ch/) then    'http://stage.jobeline.ch/ch-de/'
      when (/ch-fr/) then 'http://stage.jobeline.ch/ch-fr/'
      end
      @urlBackend = 'http://stage.jobeline.de/'
    end

    if ENV['SYSTEM'] == "live"
      @urlHttp = case ENV['COUNTRY']
        when (/de/) then 'http://www.jobeline.de/'
        when (/at/) then 'http://www.jobeline.at/'
        when (/ch/) then 'http://www.jobeline.ch/ch-de'
        when (/ch-fr/) then 'http://www.jobeline.ch/ch-fr'
      end
      @urlHttps = case ENV['COUNTRY']
        when (/de/) then 'https://www.jobeline.de/'
        when (/at/) then 'https://www.jobeline.at/'
        when (/ch/) then 'https://www.jobeline.ch/ch-de/'
        when (/ch-fr/) then 'https://www.jobeline.ch/ch-fr/'
      end
      @urlBackend = 'https://www.jobeline.de/'
    end
    @url_add_comand = 'direktbestellen'
    @baby_steps = true
  end
end
