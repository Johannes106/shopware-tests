#hotelwaesche
class User
  attr_accessor :customer_number, :eMail, :eMail_sec ,:password, :password_sec, :company, :company_kind, :firstname, :lastname, :department, :prefix, :prefix_sec, :street, :streetnumber,
                :postcode, :city, :telephone, :taxid, :taxvat, :organumber, :country, :country_area, :owner_firstname, :owner_lastname, :language_change_to, :country_contraction_language_change_to, :payment_methods

  def initialize
    @customer_number = case ENV['COUNTRY'] #kundennummer
      when 'de' then '20027336'#'493444351'
      when 'at' then '20012564'#'495078249'
      when 'ch' then '20014013'#'211608920'
    end
    @eMail = case ENV['COUNTRY']
      when 'de' then 'testmail_hde@emmos.de'
      when 'at' then 'testmail_hat@emmos.de'
      when 'ch' then 'testmail_hch@emmos.de'
    end
    @eMail_sec = case ENV['COUNTRY']
      when 'de' then 'testmail@hde.de'
      when 'at' then 'testmail@hat.de'
      when 'ch' then 'testmail@hch.de'
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
      when 'de' then 'Hotelwäsche Erwin Müller GmbH Test - eBusiness'
      when 'at' then 'HW Erwin Müller EM Group AUT GmbH & Co.KG - Test-eBusiness'#'Hotelwäsche Erwin Müller GmbH & Co. KG Test-eBusiness'
      when 'ch' then 'Hotelwäsche Erwin Müller EM Group Schweiz GmbH -Test - eBusiness'#'Hotelwäsche Erwin Müller GmbH Test - eBusiness'
    end
    @company_kind = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
    end
    @taxid = case ENV['COUNTRY'] #Steuernummer vom Unternehmen
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
      when 'at' then 'Schloßgasse'
      when 'ch' then 'Tramstrasse'
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
    id_country = 1
    case string_country
      when "Deutschland"
        puts "Germany"
        id_country = 1
      when "Österreich"
        puts "Austria"
        id_country = 3
      when "Schweiz"
        puts "Switzerland"
        id_country = 4
    end
    return id_country
  end

end
