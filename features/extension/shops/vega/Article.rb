#vega
class Article
  attr_accessor :sub_category, :category, :category_language_changed, :productnumber, :sku, :amount, :name, :url_add_comand

  def initialize
    @sub_category = case ENV['COUNTRY']
      when (/de/) then 'Einzelbesteck'
      when (/at/) then 'Einzelbesteck'
      when (/ch/) then 'Einzelbesteck'
      when (/it/) then 'Posate singole'
      when (/fr/) then 'Couverts à l\'unité'
      when (/no/) then 'Vinglass'
      when (/se/) then 'Bestickdelar'
      when (/nl/) then 'Los bestek'
      when (/be/) then 'Couverts à l\'unité'
      when (/es/) then 'Cubiertos sueltos'
      when (/en/) then 'Forks'
    end
    @category = case ENV['COUNTRY']
      when (/de/) then 'Besteck'
      when (/at/) then 'Besteck'
      when (/ch/) then 'Besteck'
      when (/it/) then 'Posate'
      when (/fr/) then 'Couverts'
      when (/no/) then 'Glass'
      when (/se/) then 'Bestick'
      when (/nl/) then 'Bestek'
      when (/be/) then 'Couverts'
      when (/es/) then 'Cubiertos'
      when (/en/) then 'Cutlery'
    end
    @category_language_changed = case ENV['COUNTRY']
      when (/ch/) then 'Vaisselle'
      when (/be/) then 'Servies'
    end
    @productnumber = case ENV['COUNTRY']
      when (/de/) then '116366'#without i!
      when (/at/) then '116366'
      when (/ch/) then '116366'
      when (/it/) then '116366'
      when (/fr/) then '116366'
      when (/no/) then '116366'#other product
      when (/se/) then '116366'
      when (/nl/) then '116366'
      when (/be/) then '116366'
      when (/es/) then '116366'
      when (/en/) then '116366'
    end
    @sku = case ENV['COUNTRY']
      when (/de/) then '10082961'#without i!
      when (/at/) then '10082961'
      when (/ch/) then '10082961'
      when (/it/) then '10082961'
      when (/fr/) then '10082961'
      when (/no/) then '10082961'
      when (/se/) then '10082961'
      when (/nl/) then '10082961'
      when (/be/) then '10082961'
      when (/es/) then '10082961'
      when (/en/) then '10082961'
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
      when (/be/) then 2
      when (/es/) then 2
      when (/en/) then 2
    end
    #no umlauts
    @name = case ENV['COUNTRY']
      when (/de/) then 'Base'
      when (/at/) then 'Base'
      when (/ch/) then 'Base'
      when (/it/) then 'Base'
      when (/fr/) then 'Assiette plate Reims'
      when (/no/) then 'Base'
      when (/se/) then 'Base'
      when (/nl/) then 'Base'
      when (/be/) then 'Assiette plate Reims'
      when (/es/) then 'Base'
      when (/en/) then 'Base'
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
      when (/be/) then 'EMGroupDirectOrder'
      when (/es/) then 'EMGroupDirectOrder'
      when (/en/) then 'EMGroupDirectOrder'
    end
  end
end
