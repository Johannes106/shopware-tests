#v_jobeline VAT_ID REG??? NO?
class User
  attr_accessor :customer_number, :eMail, :eMail_sec ,:password, :password_sec, :company, :company_kind, :firstname, :lastname, :department, :prefix, :prefix_sec, :street, :streetnumber,
                :postcode, :city, :telephone, :taxid, :taxvat, :organumber, :country, :owner_firstname, :owner_lastname, :language_change_to, :country_contraction_language_change_to, :payment_methods

  def initialize
    @customer_number = case ENV['COUNTRY']
      when 'de' then '20035829'#'493444604'
      when 'at' then '20012615'#'495078701'
      when 'ch' then '20013813'#'211609597'
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then '20012758'#nil
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
    end
    @eMail = case ENV['COUNTRY']
      when 'de' then 'testmail_vjde@emmos.de'
      when 'at' then 'testmail_vjat@emmos.de'
      when 'ch' then 'testmail_vjch@emmos.de'
      when 'it' then 'testmail_vjit@emmos.de'
      when 'fr' then 'testmail_vjfr@emmos.de'
      when 'no' then 'testmail_vjno@emmos.de'
      when 'se' then 'testmail_vjse@emmos.de'
      when 'nl' then 'testmail_vjnl@emmos.de'
      when 'be' then 'testmail_vjbe@emmos.de'
      when 'es' then 'testmail_vjes@emmos.de'
      when 'en' then 'testmail_vjen@emmos.de'
    end
    @eMail_sec = case ENV['COUNTRY']
      when 'de' then 'testmail@vjde.de'
      when 'at' then 'testmail@vjat.de'
      when 'ch' then 'testmail@vjch.de'
      when 'it' then 'testmail@vjit.de'
      when 'fr' then 'testmail@vjfr.de'
      when 'no' then 'testmail@vjno.de'
      when 'se' then 'testmail@vjse.de'
      when 'nl' then 'testmail@vjnl.de'
      when 'be' then 'testmail@vjbe.de'
      when 'es' then 'testmail@vjes.de'
      when 'en' then 'testmail@vjen.de'
    end
    @password = case ENV['COUNTRY']
      when 'de' then 'Test2014'
      when 'at' then 'Test2014'
      when 'ch' then 'Test2014'
      when 'it' then 'Test2014'
      when 'fr' then 'Test2014'
      when 'no' then 'Test2014'
      when 'se' then 'Test2014'
      when 'nl' then 'Test2014'
      when 'be' then 'Test2014'
      when 'es' then 'Test2014'
      when 'en' then 'Test2014'
    end
    @password_sec = case ENV['COUNTRY']
      when 'de' then 'Test2015'
      when 'at' then 'Test2015'
      when 'ch' then 'Test2015'
      when 'it' then 'Test2015'
      when 'fr' then 'Test2015'
      when 'no' then 'Test2015'
      when 'se' then 'Test2015'
      when 'nl' then 'Test2015'
      when 'be' then 'Test2015'
      when 'es' then 'Test2015'
      when 'en' then 'Test2015'
    end
    @company = case ENV['COUNTRY']
      when 'de' then 'VEGA GmbH - Jobeline Test-eBusiness'#'Test DE Jobeline - eBusiness'
      when 'at' then 'VEGA - EM Group AUT GmbH & Co.KG - Jobeline Test-eBusiness'#'Test AT Jobeline - eBusiness'
      when 'ch' then 'VEGA - EM Group Schweiz GmbH - Jobeline Test-eBusiness'#'Test CH Jobeline - eBusiness'
      when 'it' then 'Test IT Jobeline - eBusiness'
      when 'fr' then 'Test FR Jobeline - eBusiness'
      when 'no' then 'Test NO Jobeline - eBusiness'
      when 'se' then 'VEGA EMG Scandinavia - Jobeline Test-eBusiness'
      when 'nl' then 'Test NL Jobeline - eBusiness'
      when 'be' then 'Test BE Jobeline - eBusiness'
      when 'es' then 'Test ES Jobeline - eBusiness'
      when 'en' then 'Test EN Jobeline - eBusiness'
    end
    @company_kind = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
    end
    @taxid = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then 'IT99999999999'
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then '22065260'
      when 'be' then '22065260'
      when 'es' then 'B63679427'
      when 'en' then 'B63679427'
    end
    @taxvat = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then '02531440218' #Codice fiscale
      when 'fr' then '999204252'
      when 'no' then '999204252'
      when 'se' then '5566959234'
      when 'nl' then nil
      when 'be' then '14422876383'
      when 'en' then nil
    end
    @organumber = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then '556695-9234'
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
    end
    @country = case ENV['COUNTRY']
      when 'de' then 'Deutschland'
      when 'at' then 'Österreich'
      when 'ch' then 'Schweiz'
      when 'it' then 'Italia'
      when 'fr' then 'France'
      when 'no' then 'Norge'
      when 'se' then 'Sverige'
      when 'nl' then 'Nederland'
      when 'be' then 'Belgique'
      when 'es' then nil
      when 'en' then 'GERMANY'
    end
    @owner_firstname = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
    end
    @owner_lastname = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
    end
    @firstname = case ENV['COUNTRY']
      when 'de' then 'Vorname'
      when 'at' then 'Vorname'
      when 'ch' then 'Vorname'
      when 'it' then 'Nome'
      when 'fr' then 'Prenom'
      when 'no' then 'Fornavn'
      when 'se' then 'Förnamn'
      when 'nl' then 'Voornaam'
      when 'be' then 'Prenom'
      when 'es' then 'Nombre'
      when 'en' then 'First'
    end
    @lastname = case ENV['COUNTRY']
      when 'de' then 'Nachname'
      when 'at' then 'Nachname'
      when 'ch' then 'Nachname'
      when 'it' then 'Cognome'
      when 'fr' then 'Nom'
      when 'no' then 'Etternavn'
      when 'se' then 'Efternamn'
      when 'nl' then 'Achternaam'
      when 'be' then 'Nom'
      when 'es' then 'Apellido'
      when 'en' then 'Apellido'
    end
    @department = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
    end
    @prefix = case ENV['COUNTRY']
      when 'de' then 'Herr'
      when 'at' then 'Herr'
      when 'ch' then 'Herr'
      when 'it' then 'Sig.'
      when 'fr' then 'Monsieur'
      when 'no' then nil
      when 'se' then nil
      when 'nl' then 'Dhr.'
      when 'be' then 'Monsieur'
      when 'es' then 'Sr.'
      when 'en' then 'Mr'
    end
    @prefix_sec = case ENV['COUNTRY']
      when 'de' then 'Frau'
      when 'at' then 'Frau'
      when 'ch' then 'Frau'
      when 'it' then 'Sig.ra'
      when 'fr' then 'Madame'
      when 'no' then 'Fru'
      when 'se' then 'Fru'
      when 'nl' then 'Mevr.'
      when 'be' then 'Madame'
      when 'es' then 'Sra.'
      when 'en' then 'Ms'
    end
    @street = case ENV['COUNTRY']
      when 'de' then 'Vegastr.'
      when 'at' then 'Schloßgasse'
      when 'ch' then 'Tramstrasse'
      when 'it' then 'Via Luigi Galvani'
      when 'fr' then 'Rue Icare'
      when 'no' then 'Konows gate'
      when 'se' then 'HAMNGATAN'#'Hamngatan'
      when 'nl' then 'Cereslaan'
      when 'be' then 'Place du Luxembourg'
      when 'es' then 'Carrer de Roger de Llúria'
      when 'en' then 'Vegastr.'
    end
    @streetnumber = case ENV['COUNTRY']
      when 'de' then '44'
      when 'at' then '4'
      when 'ch' then '7'
      when 'it' then '6/C'
      when 'fr' then '4'
      when 'no' then '5'
      when 'se' then '4'
      when 'nl' then '8'
      when 'be' then '100'
      when 'es' then '44'
      when 'en' then '4'
    end
    @postcode = case ENV['COUNTRY']
      when 'de' then '86637'
      when 'at' then '4470'
      when 'ch' then '9444'
      when 'it' then '39100'
      when 'fr' then '67960'
      when 'no' then '0192'
      when 'se' then '21122'#'211 22'
      when 'nl' then '5384 VT'
      when 'be' then '1050'
      when 'es' then '08009'
      when 'en' then '86639'
    end
    @city = case ENV['COUNTRY']
      when 'de' then 'Wertingen'
      when 'at' then 'Enns'
      when 'ch' then 'Diepoldsau'
      when 'it' then 'Bolzano'
      when 'fr' then 'Entzheim'
      when 'no' then 'Oslo'
      when 'se' then 'MALMÖ'#'Malmö'
      when 'nl' then 'Heesch'
      when 'be' then 'Ixelles'
      when 'es' then 'Barcelona'
      when 'en' then 'Wertingen'
    end
    @telephone = case ENV['COUNTRY']
      when 'de' then '01234567'
      when 'at' then '01234567'
      when 'ch' then '01234567'
      when 'it' then '01234567'
      when 'fr' then '01234567'
      when 'no' then '01234567'
      when 'se' then '01234567'
      when 'nl' then '01234567'
      when 'be' then '01234567'
      when 'es' then '01234567'
      when 'en' then '01234567'
    end
    @language_change_to = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then 'Français'
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'be' then 'Néerlandais'
      when 'es' then nil
      when 'en' then nil
    end
    @country_contraction_language_change_to = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then 'fr'
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'be' then 'nl'
      when 'es' then nil
      when 'en' then nil
    end
    @payment_methods = case ENV['COUNTRY']
      when 'de' then ['Rechnung', 'Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'at' then ['Rechnung', 'Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'ch' then ['Rechnung', 'Nachnahme', 'Kreditkarte', 'Vorauskasse', 'Paypal']
      when 'it' then ['Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'fr' then ['Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'no' then ['Nachnahme', 'Kreditkarte', 'Vorkasse']
      when 'se' then ['Nachnahme', 'Kreditkarte', 'Vorkasse']
      when 'nl' then ['Rechnung', 'Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal', 'iDeal']
      when 'es' then ['Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'be' then ['Nachnahme', 'Kreditkarte', 'Vorkasse', 'Paypal']
      when 'en' then ['Paypal', 'Vorkasse']
    end
  end

  #convert string of country into ID (s_core_shops)
  def convert_countryname_to_shopId(string_country)
    id_country = 1
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
      when "Italia"
        puts "Italy"
        id_country = 20
      when "France"
        puts "France"
        id_country = 18
      when "Norge"
        puts "Norway"
        id_country = 23
      when "Sverige"
        puts "Sweden"
        id_country = 19
      when "Nederland"
        puts "Nederland"
        id_country = 22
      when "Belgique"
        puts "Begium"
        id_country = 24
      when "Espana"
        puts "Spain"
        id_country = 21
    end
    return id_country
  end

end
