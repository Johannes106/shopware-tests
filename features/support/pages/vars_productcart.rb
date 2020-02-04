#product_page
class Csspathes_Productcart
  attr_accessor :homepage_content_logo_path,
                :product_cart_article_path, :product_cart_hint_content_path, :product_cart_button_continue_path, :product_cart_remove_article_path, :product_cart_article_path, :product_cart_article_details_path, :product_cart_article_price_path, :product_cart_article_voucher_path, :product_cart_button_checkout_path,
                :product_cart_checkout_steps_path, :product_cart_voucher_checkbox_path, :product_cart_voucher_input_path, :product_cart_voucher_button_path, :product_cart_order_sku_path, :product_cart_order_button_path

  def initialize
    @homepage_content_logo_path = '.logo--shop-main'
    @product_cart_article_path = '.compare--quantity'
    @product_cart_button_continue_path = '.table--content > a.content--title'
    @product_cart_remove_article_path = '.column--actions > form > button'
    @product_cart_article_path = '.row--product'
    @product_cart_hint_content_path = "div > div > div > div > .alert--content"
    @product_cart_article_details_path = 'div.table--tr.block-group.row--product.is--last-row'
    @product_cart_article_price_path = 'div.basket--footer > ul'
    @product_cart_article_voucher_path = 'div.panel--td.column--quantity.is--align-right'
    @product_cart_button_checkout_path = '.btn--checkout-proceed'
    @product_cart_checkout_steps_path = 'div.steps--container.container'
    @product_cart_voucher_checkbox_path = '.add-voucher--form > div > input'
    @product_cart_voucher_input_path = 'form.table--add-voucher.add-voucher--form > div > input'
    @product_cart_voucher_button_path = 'form.table--add-voucher.add-voucher--form > div > button'
    @product_cart_order_sku_path = 'div.panel.has--border > div > form > input'
    @product_cart_order_button_path = 'div.panel.has--border > div > form > button'
    update_pathes
  end

  def update_pathes
    #give vars of enviroment to local vars
    @env_country ||= VARS_ENV.r_country
    @env_system ||= VARS_ENV.r_system
    @env_shop ||= VARS_ENV.r_shop
    # define hash of countries
    @homepage_content_logo_path = ".logo-main" if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_cart_article_path = 'div.panel.has--border' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_cart_button_continue_path = '.continue-shopping--action' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_cart_remove_article_path = '.row--product.is--last-row > div.panel--td.column--actions > form > button > i' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/it/)
    @product_cart_remove_article_path = 'div.panel--td.column--actions > a' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_cart_button_checkout_path = 'a.btn.btn--checkout-proceed.is--primary.right.is--icon-right.is--large' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_cart_voucher_checkbox_path = '#add-voucher--trigger' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_cart_voucher_checkbox_path = '#add-voucher--trigger' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_cart_voucher_input_path = '.add-voucher--form > div > input' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/)
  end

end
