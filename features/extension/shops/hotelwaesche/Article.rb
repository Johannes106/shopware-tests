#hotelwaesche
class Article
  attr_accessor :sub_category, :category, :category_language_changed, :productnumber, :sku, :amount, :name, :url_add_comand

  def initialize
    @sub_category = case ENV['COUNTRY']
      when (/de/) then 'Badematten'
      when (/at/) then 'Badematten'
      when (/ch/) then 'Badematten'
    end
    @category = case ENV['COUNTRY']
      when (/de/) then 'Frottier & Bad'
      when (/at/) then 'Frottier & Bad'
      when (/ch/) then 'Frottier & Bad'
    end
    @category_language_changed = case ENV['COUNTRY']
      when (/ch/) then 'Linge de table'
      when (/be/) then 'Bestek'
    end
    @productnumber = case ENV['COUNTRY']
      when (/de/) then '101853'
      when (/at/) then '101853'
      when (/ch/) then '101853'
    end
    @sku = case ENV['COUNTRY']
      when (/de/) then '10000811'
      when (/at/) then '10000811'
      when (/ch/) then '10000811'
    end
    @amount = case ENV['COUNTRY']
      when (/de/) then 2
      when (/at/) then 2
      when (/ch/) then 2
    end
    @name = case ENV['COUNTRY']
      when (/de/) then 'Badematte Classico'
      when (/at/) then 'Badematte Classico'
      when (/ch/) then 'Badematte Classico'
    end
    @url_add_comand = case ENV['COUNTRY']
      when (/de/) then 'EMGroupDirectOrder'
      when (/at/) then 'EMGroupDirectOrder'
      when (/ch/) then 'EMGroupDirectOrder'
    end
  end
end
