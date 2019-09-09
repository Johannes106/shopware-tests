#v_jobeline
class Article
  attr_accessor :sub_category, :category, :category_language_changed, :productnumber, :sku, :amount, :name, :url_add_comand

  def initialize
    @sub_category = case ENV['COUNTRY']
      when (/de/) then 'Kochhosen'
      when (/at/) then 'Kochhosen'
      when (/ch/) then 'Kochhosen'
      when (/it/) then 'Pantaloni da cuoco'
      when (/fr/) then 'Couverts à l\'unité'
      when (/no/) then 'Vinglass'
      when (/se/) then 'Enskilda bestick'
      when (/nl/) then 'Los bestek'
      when (/be/) then 'Couverts à l\'unité'
      when (/es/) then 'Piezas sueltas'
      when (/en/) then 'Vests'
    end
    @category = case ENV['COUNTRY']
      when (/de/) then 'Kochbekleidung'
      when (/at/) then 'Kochbekleidung'
      when (/ch/) then 'Kochbekleidung'
      when (/it/) then 'Abbigliamento cucina'
      when (/fr/) then 'Tenues de cuisine'
      when (/no/) then 'Kokkeklær'
      when (/se/) then 'Kockkläder'
      when (/nl/) then 'Kokskleding'
      when (/be/) then 'Tenues de cuisine'
      when (/es/) then 'Ropa de cocina'
      when (/en/) then 'Service clothing'
    end
    @category_language_changed = case ENV['COUNTRY']
      when (/ch/) then 'Tenues de cuisine'
      when (/be/) then 'Kokskleding'
    end
    @productnumber = case ENV['COUNTRY']
      when (/de/) then '100710'
      when (/at/) then '100710'
      when (/ch/) then '100710'
      when (/it/) then '100710'
      when (/fr/) then '100710'
      when (/no/) then '100710'
      when (/se/) then '100710'
      when (/nl/) then '100710'
      when (/be/) then '100710'
      when (/es/) then '100710'
      when (/en/) then '100710'
    end
    @sku = case ENV['COUNTRY']
      when (/de/) then '10041838'
      when (/at/) then '10041838'
      when (/ch/) then '10041838'
      when (/it/) then '10041838'
      when (/fr/) then '10041838'
      when (/no/) then '10041838'
      when (/se/) then '10041838'
      when (/nl/) then '10041838'
      when (/be/) then '10041838'
      when (/es/) then '10041838'
      when (/en/) then '10041838'
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
      when (/de/) then 'NICK'
      when (/at/) then 'NICK'
      when (/ch/) then 'NICK'
      when (/it/) then 'NICK'
      when (/fr/) then 'NICK'
      when (/no/) then 'NICK'
      when (/se/) then 'NICK'
      when (/nl/) then 'NICK'
      when (/be/) then 'NICK'
      when (/es/) then 'NICK'
      when (/en/) then 'Nick'
    end
    @url_add_comand = case ENV['COUNTRY']
      when (/de/) then 'EMGroupDirectOrder'
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
