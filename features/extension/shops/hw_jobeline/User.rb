#hw_jobeline
class User
  attr_accessor :eMail, :eMail_sec ,:password, :password_sec, :company, :company_kind, :firstname, :lastname, :department, :prefix, :prefix_sec, :street, :streetnumber,
                :postcode, :city, :telephone, :customer_number, :taxid, :taxvat, :organumber, :country, :country_area, :owner_firstname, :owner_lastname, :language_change_to,
                :country_contraction_language_change_to, :payment_methods

  def initialize
    @customer_number = case ENV['COUNTRY']
      when 'de' then '20027337'#'493444604'
      when 'at' then '20012565'#'495078701'
      when 'ch' then '211609597'#'211609597'
    end
    @eMail = case ENV['COUNTRY']
      when 'de' then 'testmail_hwjde@emmos.de'
      when 'at' then 'testmail_hwjat@emmos.de'
      when 'ch' then 'testmail_hwjch@emmos.de'
    end
    @eMail_sec = case ENV['COUNTRY']
      when 'de' then 'testmail@hwjde.de'
      when 'at' then 'testmail@hwjat.de'
      when 'ch' then 'testmail@hwjch.de'
    end
    @password = case ENV['COUNTRY']
      when 'de' then 'Test2014'
      when 'at' then 'Test2014'
      when 'ch' then 'Test2014'
    end
    @password_sec = case ENV['COUNTRY']
      when 'de' then 'Test2015'
      when 'at' then 'Test2015'
      when 'ch' then 'Test2015'
    end
    @company = case ENV['COUNTRY']
      when 'de' then 'Hotelwäsche Erwin Müller GmbH Jobeline-Test-eBus.'#'Hotelwäsche Erwin Müller GmbH	Jobeline-Test-eBus.'
      when 'at' then 'HW Erwin Müller EM Group AUT GmbH & Co.KG - Jobeline Test-eB.'#'Hotelwäsche Erwin Müller GmbH& Co.KG-Jobel.-Test-eB'
      when 'ch' then 'HW Erwin Müller EM Group Schweiz GmbH -Jobeline Test - eBus.'#'Hotelwäsche Erwin Müller Jobeline-Test-eBus.'
    end
    @company_kind = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @taxid = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @taxvat = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @organumber = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @country = case ENV['COUNTRY']
      when 'de' then 'Deutschland'
      when 'at' then 'Österreich'
      when 'ch' then 'Schweiz'
    end
    @country_area = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @owner_firstname = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @owner_lastname = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @firstname = case ENV['COUNTRY']
      when 'de' then 'Vorname'
      when 'at' then 'Vorname'
      when 'ch' then 'Vorname'
    end
    @lastname = case ENV['COUNTRY']
      when 'de' then 'Nachname'
      when 'at' then 'Nachname'
      when 'ch' then 'Nachname'
    end
    @department = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @prefix = case ENV['COUNTRY']
      when 'de' then 'Herr'
      when 'at' then 'Herr'
      when 'ch' then 'Herr'
    end
    @prefix_sec = case ENV['COUNTRY']
      when 'de' then 'Frau'
      when 'at' then 'Frau'
      when 'ch' then 'Frau'
    end
    @street = case ENV['COUNTRY']
      when 'de' then 'Hettlinger Str.'
      when 'at' then 'Tramstrasse'
      when 'ch' then 'Schloßgasse'#'Schlossgasse'
    end
    @streetnumber = case ENV['COUNTRY']
      when 'de' then '9'
      when 'at' then '4'
      when 'ch' then '7'
    end
    @postcode = case ENV['COUNTRY']
      when 'de' then '86637'
      when 'at' then '4470'
      when 'ch' then '9444'
    end
    @city = case ENV['COUNTRY']
      when 'de' then 'Wertingen'
      when 'at' then 'Enns'
      when 'ch' then 'Diepoldsau'
    end
    @telephone = case ENV['COUNTRY']
      when 'de' then '01234567'
      when 'at' then '01234567'
      when 'ch' then '01234567'
    end
    @language_change_to = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then 'Französisch'
    end
    @country_contraction_language_change_to = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then 'fr'
    end
    @payment_methods = case ENV['COUNTRY']
      when 'de' then ['Rechnung', 'Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'at' then ['Rechnung', 'Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'ch' then ['Rechnung', 'Nachnahme', 'Kreditkarte', 'Vorauskasse', 'Paypal']
    end
  end

  #convert string of country into ID (s_core_shops)
  def convert_countryname_to_shopId(string_country)
    id_country = 14
    case string_country
      when "Deutschland"
        puts "Germany"
        id_country = 14
      when "Österreich"
        puts "Austria"
        id_country = 15
      when "Schweiz"
        puts "Switzerland"
        id_country = 16
    end
    return id_country
  end

end
