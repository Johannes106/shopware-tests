#search
class Csspathes_Search
  attr_accessor :homepage_content_logo_path,
                :search_searchfield_path, :search_searchbutton_path, :search_product_name_path, :search_results_path, :search_searchbutton_icon_path

  def initialize
    @homepage_content_logo_path = '.logo--shop-main'
    @search_searchfield_path = '.entry--search > form > input'
    @search_searchbutton_path = '.entry--search > form > button'
    @search_searchbutton_icon_path = '.entry--search > form > button > i'
    @search_product_name_path = '.product--header' #pdp: .MainProductName
    @search_results_path = '.search--results'
    update_pathes
  end

  def update_pathes
    #give vars of enviroment to local vars
    @env_country ||= VARS_ENV.r_country
    @env_system ||= VARS_ENV.r_system
    @env_shop ||= VARS_ENV.r_shop
    #pdp
    @homepage_content_logo_path = ".logo-main" if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @search_product_name_path = '.MainProductName'  if ("#{@env_shop}".match(/hotelwaesche|hw_jobeline|vega|v_jobeline|pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)) #|| ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    # define hash of countries
    #@search_results_path = '.content-main--inner > .content--wrapper' if "#{@env_shop}".match(/(pulsiva|hw_jobeline)/) && "#{@env_country}".match(/[a-z]{2}/)
    @search_results_path = '.content-main--inner > .content--wrapper' if "#{@env_shop}".match(/(pulsiva|hw_jobeline|hotelwaesche)/) && "#{@env_country}".match(/[a-z]{2}/)
  end

end
