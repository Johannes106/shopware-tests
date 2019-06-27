#pulsiva
class Article
  attr_accessor :sub_category, :category, :category_language_changed, :productnumber, :sku, :amount, :name, :url_add_comand

  def initialize
    @sub_category = case ENV['COUNTRY']
      when (/de/) then 'Gabeln'
      when (/at/) then 'Gabeln'
      when (/ch/) then 'Gabeln'
      when (/it/) then 'Posate singole'
      when (/fr/) then 'Couverts à l\'unité'
      when (/no/) then 'Enkelt bestikk'
      when (/se/) then 'Enskilda bestick'
      when (/nl/) then 'Los bestek'
      when (/es/) then 'Piezas sueltas'
    end
    @category = case ENV['COUNTRY']
      when (/de/) then 'Besteck'
      when (/at/) then 'Besteck'
      when (/ch/) then 'Besteck'
      when (/it/) then 'Posate'
      when (/fr/) then 'Couverts'
      when (/no/) then 'Bestikk'
      when (/se/) then 'Bestick'
      when (/nl/) then 'Bestek'
      when (/es/) then 'Cubiertos'
    end
    @category_language_changed = case ENV['COUNTRY']
      when (/ch/) then 'Vaisselle'
    end
    @productnumber = case ENV['COUNTRY']
      when (/de/) then '104105'#without i!
      when (/at/) then '104105'
      when (/ch/) then '104105'
      when (/it/) then '104105'
      when (/fr/) then '104105'
      when (/no/) then '104105'#other product
      when (/se/) then '104105'
      when (/nl/) then '104105'
      when (/es/) then '104105'
    end
    @sku = case ENV['COUNTRY']
      when (/de/) then '20040136'#without i!
      when (/at/) then '20040136'
      when (/ch/) then '20040136'
      when (/it/) then '20040136'
      when (/fr/) then '20040136'
      when (/no/) then '20040136'#other product
      when (/se/) then '20040136'
      when (/nl/) then '20040136'
      when (/es/) then '20040136'
    end
    @amount = case ENV['COUNTRY']
      when (/de/) then 2
      when (/at/) then 2
      when (/ch/) then 2
      when (/it/) then 2
      when (/fr/) then 2
      when (/no/) then 2
      when (/se/) then 2
      when (/nl/) then 2
      when (/es/) then 2
    end
    #no umlauts
    @name = case ENV['COUNTRY']
      when (/de/) then 'Steakgabel'
      when (/at/) then 'Steakgabel'
      when (/ch/) then 'Steakgabel'
      when (/it/) then 'FORCHETTA BISTECCA'
      when (/fr/) then 'Fourchette'
      when (/no/) then 'Grillgaffel'
      when (/se/) then 'Köttgaffel Assisi'
      when (/nl/) then 'STEAKVORK'
      when (/es/) then 'TENEDOR PARA CARNE'
    end
    @url_add_comand = case ENV['COUNTRY']
      when (/de/) then 'direktbestellen'
      when (/at/) then 'EMGroupDirectOrder'
      when (/ch/) then 'EMGroupDirectOrder'
      when (/it/) then 'acquistato'
      when (/fr/) then 'EMGroupDirectOrder'
      when (/no/) then 'EMGroupDirectOrder'
      when (/se/) then 'EMGroupDirectOrder'
      when (/nl/) then 'EMGroupDirectOrder'
      when (/es/) then 'EMGroupDirectOrder'
    end
  end
end
