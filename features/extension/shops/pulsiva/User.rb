#pulsiva
class User
  attr_accessor :eMail, :eMail_sec ,:password, :password_sec, :company, :company_kind, :firstname, :lastname, :department, :prefix, :prefix_sec, :street, :streetnumber,
                :postcode, :city, :telephone, :customer_number, :taxid, :taxvat, :organumber, :country, :owner_firstname, :owner_lastname, :language_change_to, :country_contraction_language_change_to, :payment_methods

  def initialize
    @customer_number = case ENV['COUNTRY']
      when 'de' then '20004906'#'20004906'
      when 'at' then '20000021'#'20000021'
      when 'ch' then '20000024'#'20000024'
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then '20000041'#'20000041'
      when 'nl' then nil
      when 'es' then nil
    end
    @eMail = case ENV['COUNTRY']
      when 'de' then 'testmail_pde@emmos.de'
      when 'at' then 'testmail_pat@emmos.de'
      when 'ch' then 'testmail_pch@emmos.de'
      when 'it' then 'testmail_pit@emmos.de'
      when 'fr' then 'testmail_pfr@emmos.de'
      when 'no' then 'testmail_pno@emmos.de'
      when 'se' then 'testmail_pse@emmos.de'
      when 'nl' then 'testmail_pnl@emmos.de'
      when 'es' then 'testmail_pes@emmos.de'
    end
    @eMail_sec = case ENV['COUNTRY']
      when 'de' then 'testmail@pde.de'
      when 'at' then 'testmail@pat.de'
      when 'ch' then 'testmail@pch.de'
      when 'it' then 'testmail@pit.de'
      when 'fr' then 'testmail@pfr.de'
      when 'no' then 'testmail@pno.de'
      when 'se' then 'testmail@pse.de'
      when 'nl' then 'testmail@pnl.de'
      when 'es' then 'testmail@pes.de'
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
      when 'es' then 'Test2014'
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
      when 'es' then 'Test2015'
    end
    @company = case ENV['COUNTRY']
      when 'de' then 'Pulsiva GmbH Test - eBusiness'#'Pulsiva GmbH Test - eBusiness'
      when 'at' then 'Pulsiva EM Group AUT GmbH & Co.KG - Test-eBusiness'#'Hotelwäsche Erwin Müller GmbH&Co. KG Pulsiva-Test-eB'
      when 'ch' then 'Pulsiva EM Group Schweiz GmbH -Test - eBusiness'#'Pulsiva GmbH Test - eBusiness'
      when 'it' then 'Pulsiva Italy GmbH'
      when 'fr' then 'Pulsiva France'
      when 'no' then 'Pulsiva Norge'
      when 'se' then 'Pulsiva EMG Scandinavia - Test-eBusiness'#'Pulsiva Scandinavia - eBusiness '
      when 'nl' then 'Pulsiva Nederland'
      when 'es' then 'Pulsiva Espana'
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
      when 'es' then nil
    end
    @taxid = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then 'IT99999999999'
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'es' then 'B63679427'
    end
    @taxvat = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then "CodiceFiscale56"
      when 'fr' then '999204252'
      when 'no' then '999204252'
      when 'se' then '5566959234'
      when 'nl' then 'NL818450010B01'
      when 'es' then nil
    end
    @organumber = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'es' then nil
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
      when 'es' then nil
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
      when 'es' then nil
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
      when 'es' then 'Nombre'
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
      when 'es' then 'Apellido'
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
      when 'es' then nil
    end
    @prefix = case ENV['COUNTRY']
      when 'de' then 'Herr'
      when 'at' then 'Herr'
      when 'ch' then 'Herr'
      when 'it' then 'Sig'
      when 'fr' then 'Monsieur'
      when 'no' then 'Herr'
      when 'se' then 'Herr'
      when 'nl' then 'Dhr.'
      when 'es' then 'Sr.'
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
      when 'es' then 'Sra.'
    end
    @street = case ENV['COUNTRY']
      when 'de' then 'Südwestpark'
      when 'at' then 'Schloßgasse'
      when 'ch' then 'Tramstrasse'
      when 'it' then 'Via Luigi Galvani'
      when 'fr' then 'Rue Icare'
      when 'no' then 'Konows gate'
      when 'se' then 'HAMNGATAN'#'Hamngatan'
      when 'nl' then 'Cereslaan'
      when 'es' then 'Carrer de Roger de Llúria'
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
      when 'es' then '44'
    end
    @postcode = case ENV['COUNTRY']
      when 'de' then '90449'
      when 'at' then '4470'
      when 'ch' then '9444'
      when 'it' then '39100'
      when 'fr' then '67960'
      when 'no' then '0192'
      when 'se' then '21122'#'211 22'
      when 'nl' then '5384 VT'
      when 'es' then '08009'
    end
    @city = case ENV['COUNTRY']
      when 'de' then 'Nürnberg'
      when 'at' then 'Enns'
      when 'ch' then 'Diepoldsau'
      when 'it' then 'Bolzano'
      when 'fr' then 'Entzheim'
      when 'no' then 'Oslo'
      when 'se' then 'MALMÖ'#'Malmö'
      when 'nl' then 'Heesch'
      when 'es' then 'Barcelona'
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
      when 'es' then '01234567'
    end
    @language_change_to = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then 'Französisch'
      when 'it' then nil
      when 'fr' then nil
      when 'no' then nil
      when 'se' then nil
      when 'nl' then nil
      when 'es' then nil
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
      when 'es' then nil
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
      when 'es' then ['Kreditkarte', 'Vorkasse', 'Paypal']#'Nachnahme', 
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
        id_country = 12
      when "Schweiz"
        puts "Switzerland"
        id_country = 8
      when "Italia"
        puts "Italy"
        id_country = 3
      when "France"
        puts "France"
        id_country = 6
      when "Norge"
        puts "Norway"
        id_country = 16
      when "Sverige"
        puts "Sweden"
        id_country = 14
      when "Nederland"
        puts "Nederland"
        id_country = 20
      when "Belgique"
        puts "Begium"
        id_country = 22
      when "Espana"
        puts "Spain"
        id_country = 18
    end
    return id_country
  end

end
