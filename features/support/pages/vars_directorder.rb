#directorder
class Csspathes_Directorder
  attr_accessor :homepage_content_logo_path,
                :direct_ordering_button_path, :direct_ordering_form_sku_path, :direct_ordering_form_quantity_path, :direct_ordering_form_button_path, :direct_ordering_sidebar_item_path

  def initialize
    @homepage_content_logo_path = '.logo--shop-main'
    @direct_ordering_button_path = '.header--directOrder'
    @direct_ordering_form_sku_path = '.emgroup-direct-order-searchterm-column > input'
    @direct_ordering_form_quantity_path = '.emgroup-direct-order-quantity-column > div'
    @direct_ordering_form_button_path = '.emgroup-direct-order-submit'
    @direct_ordering_sidebar_item_path = 'div.item--container > div > a'
    update_pathes
  end

  def update_pathes
    @env_country ||= VARS_ENV.r_country
    @env_system ||= VARS_ENV.r_system
    @env_shop ||= VARS_ENV.r_shop
    # define hash of countries
    @homepage_content_logo_path = ".logo-main" if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @direct_ordering_form_button_path = 'form > button.emgroup-direct-order-submit.btn.right.is--icon-left' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/)
    @direct_ordering_form_button_path = 'form > button.emgroup-direct-order-submit.btn.right.is--icon-left' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @direct_ordering_sidebar_item_path = '.container--ajax-cart' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/)
  end

end
