#vega
class User
  attr_accessor :customer_number, :eMail, :eMail_sec ,:password, :password_sec, :company, :company_kind, :firstname, :lastname, :department, :prefix, :prefix_sec, :street, :streetnumber,
                :postcode, :city, :telephone, :taxid, :taxvat, :organumber, :country, :country_area, :owner_firstname, :owner_lastname, :language_change_to, :country_contraction_language_change_to, :payment_methods

  def initialize
    @customer_number = case ENV['COUNTRY']
      when 'de' then '20033676'#'593497053'
      when 'at' then '595067365'#'595067365'
      when 'ch' then '311607643'#'311607643'
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then '20010015'#'20010015' NO?
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
    end
    @eMail = case ENV['COUNTRY']
      when 'de' then 'testmail_vde@emmos.de'
      when 'at' then 'testmail_vat@emmos.de'
      when 'ch' then 'testmail_vch@emmos.de'
      when 'it' then 'testmail_vit@emmos.de'
      when 'fr' then 'testmail_vfr@emmos.de'
      when 'no' then 'testmail_vno@emmos.de'
      when 'se' then 'testmail_vse@emmos.de'
      when 'nl' then 'testmail_vnl@emmos.de'
      when 'be' then 'testmail_vbe@emmos.de'
      when 'es' then 'testmail_ves@emmos.de'
      when 'en' then 'testmail_ven@emmos.de'
      when 'lu' then 'testmail_vlu@emmos.de'
    end
    @eMail_sec = case ENV['COUNTRY']
      when 'de' then 'testmail@vde.de'
      when 'at' then 'testmail@vat.de'
      when 'ch' then 'testmail@vch.de'
      when 'it' then 'testmail@vit.de'
      when 'fr' then 'testmail@vfr.de'
      when 'no' then 'testmail@vno.de'
      when 'se' then 'testmail@vse.de'
      when 'nl' then 'testmail@vnl.de'
      when 'be' then 'testmail@vbe.de'
      when 'es' then 'testmail@ves.de'
      when 'en' then 'testmail@ven.de'
      when 'lu' then 'testmail@vlu.de'
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
      when 'lu' then 'Test2014'
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
      when 'lu' then 'Test2015'
    end
    @company = case ENV['COUNTRY']
      when 'de' then 'VEGA GmbH Test - eBusiness'#"VEGA GmbH	Test - eBusiness"
      when 'at' then 'VEGA - EM Group AUT GmbH & Co.KG - Test-eBusiness'#'Vega Vetriebs GmbH & Co. KG	Test - eBusiness'
      when 'ch' then 'VEGA - EM Group Schweiz GmbH - Test-eBusiness'#'Vega Vetrieb von Gastronomiebedarf GmbH'
      when 'it' then 'Test Vega IT eBusiness'
      when 'fr' then 'Test Vega FR eBusiness'
      when 'no' then 'Test Vega NO eBusiness'
      when 'se' then 'VEGA EMG Scandinavia - Test eBusiness'#'Test Vega SE eBusiness'
      when 'nl' then 'Test Vega NL eBusiness'
      when 'be' then 'Test Vega BE eBusiness'
      when 'es' then 'Test Vega ES eBusiness'
      when 'en' then 'Test Vega EN eBusiness'
      when 'lu' then 'Test Vega LU eBusiness'
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
      when 'lu' then nil
    end
    @taxid = case ENV['COUNTRY'] # steuernummer
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then 'IT02531440218'
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then '22065260'
      when 'be' then '22065260'
      when 'es' then '0123456789'
      when 'en' then '0123456789'
      when 'lu' then nil
    end
    @taxvat = case ENV['COUNTRY'] # handelsregister
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then '02531440218'
      when 'fr' then '999204252'
      when 'no' then '999204252'
      when 'se' then '5566959234'
      when 'nl' then nil
      when 'be' then '14422876383'
      when 'es' then 'ES B63679427'
      when 'en' then nil
      when 'lu' then nil
    end
    @organumber = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then nil
      when 'fr' then nil
      when 'no' then '999 204 252'
      when 'se' then '556695-9234'
      when 'nl' then nil
      when 'be' then nil
      when 'es' then nil
      when 'en' then nil
      when 'lu' then nil
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
      when 'es' then 'Espana'
      when 'en' then 'GERMANY'
      when 'lu' then nil
    end
    @country_area = case ENV['COUNTRY']
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
      when 'lu' then nil
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
      when 'lu' then nil
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
      when 'lu' then 'Vorname'
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
      when 'en' then 'Last'
      when 'lu' then 'Vorname'
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
      when 'lu' then nil
    end
    @prefix = case ENV['COUNTRY']
      when 'de' then 'Herr'
      when 'at' then 'Herr'
      when 'ch' then 'Herr'
      when 'it' then 'Sig.ra'
      when 'fr' then 'Monsieur'
      when 'no' then nil
      when 'se' then nil
      when 'nl' then 'Dhr.'
      when 'be' then 'Monsieur'
      when 'es' then 'Sr.'
      when 'en' then 'Mr'
      when 'lu' then nil
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
      when 'lu' then nil
    end
    @street = case ENV['COUNTRY']
      when 'de' then 'Vegastr.'
      when 'at' then 'Schloßgasse'#'Schlossgasse'
      when 'ch' then 'Tramstrasse'
      when 'it' then 'Via Luigi Galvani'
      when 'fr' then 'Rue Icare'
      when 'no' then 'Konows gate'
      when 'se' then 'HAMNGATAN'#'Hamngatan'
      when 'nl' then 'Cereslaan'
      when 'be' then 'Place du Luxembourg'
      when 'en' then 'Vegastr.'
      when 'es' then 'Carrer de Roger de Llúria'
      when 'lu' then nil
    end
    @streetnumber = case ENV['COUNTRY']
      when 'de' then '2'
      when 'at' then '4'
      when 'ch' then '7'
      when 'it' then '6/C'
      when 'fr' then '4'
      when 'no' then '5'
      when 'se' then '4'
      when 'nl' then '8'
      when 'be' then '100'
      when 'es' then '44'
      when 'en' then '2'
      when 'lu' then nil
    end
    @postcode = case ENV['COUNTRY']
      when 'de' then '86637'
      when 'at' then '4470'
      when 'ch' then '9444'
      when 'it' then '39100'
      when 'fr' then '67960'
      when 'no' then '0192'
      when 'se' then '21122'
      when 'nl' then '5384 VT'
      when 'be' then '1050'
      when 'es' then '08009'
      when 'en' then '86637'
      when 'lu' then nil
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
      when 'lu' then nil
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
      when 'lu' then '01234567'
    end
    @language_change_to = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then 'Französisch'#'Français'
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'be' then 'Néerlandais'
      when 'es' then nil
      when 'en' then nil
      when 'lu' then nil
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
      when 'lu' then nil
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
      when 'en' then ['Nachnahme', 'Paypal', 'Vorkasse']
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
      when "Italia"
        puts "Italy"
        id_country = 8
      when "France"
        puts "France"
        id_country = 6
      when "Norge"
        puts "Norway"
        id_country = 11
      when "Sverige"
        puts "Sweden"
        id_country = 7
      when "Nederland"
        puts "Nederland"
        id_country = 10
      when "Belgique"
        puts "Begium"
        id_country = 12
      when "Espana"
        puts "Spain"
        id_country = 9
    end
    return id_country
  end

end
