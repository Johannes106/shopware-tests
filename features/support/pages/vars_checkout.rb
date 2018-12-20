#checkout
class Csspathes_Checkout
  attr_accessor :homepage_content_logo_path, :navigation_hover_breadcrumb_path, :navigation_path, :account_registerform_vallidation_modal_path, :account_registerform_vallidation_ignore_path,
                :checkout_backbutton_path, :checkout_steps_container_path, :checkout_agb_container_path, :checkout_billing_container_path, :checkout_shipping_container_path, :checkout_payment_container_path,
                :checkout_product_container_path, :checkout_orderbutton_path, :checkout_step_payment_path, :checkout_payment_options_path, :checkout_delivery_options_path, :checkout_step_confirm_path, :checkout_panel_path, :checkout_agb_box_path, :checkout_checkout_proceed_button_path, :checkout_registerform_path, :checkout_registerform_prefix_path,
                :checkout_registerform_firstname_path, :checkout_registerform_lastname_path, :checkout_registerform_department_path, :checkout_registerform_taxvat_path, :checkout_registerform_email_path,
                :checkout_registerform_skip_path, :checkout_registerform_phone_path, :checkout_registerform_company_path, :checkout_registerform_street_path, :checkout_registerform_streetnumber_path, :checkout_registerform_postcode_path,
                :checkout_registerform_city_path, :checkout_registerform_country_path, :checkout_registerform_button_path, :checkout_payment_form_path, :checkout_paymentInAdvance_radio_path, :checkout_registerform_customernumber_path,
                :checkout_payment_continue_path, :checkout_payment_delivery_standard_radio_path, :checkout_order_success_teaser_path, :checkout_checkout_buy_button_path, :account_accountinfo_payment_options_path, :account_accountinfo_payment_radio_path,
                :account_accountinfo_payment_label_path

  def initialize
    @homepage_content_logo_path = '.logo-main'
    @navigation_hover_breadcrumb_path = '.content--breadcrumb'
    @account_registerform_vallidation_modal_path = '.replyGoogleMapsAddressValidation'
    @account_registerform_vallidation_ignore_path = '.modal-ignore'
    @checkout_backbutton_path = '.block-group > a'
    @checkout_steps_container_path = '.steps--container.container'
    @checkout_agb_container_path = '.tos--box'
    @checkout_billing_container_path = '.billing--panel'
    @checkout_shipping_container_path = '.shipping--panel'
    @checkout_payment_container_path = '.payment--panel'
    @checkout_product_container_path = '.product--table'
    @checkout_orderbutton_path = '.tos--top > div > div > button'
    @checkout_step_payment_path = '.step--register.is--active'
    @checkout_step_confirm_path = '.step--confirm.is--active'
    @checkout_agb_box_path = '#sAGB'
    @checkout_panel_path = 'section > div > div > div > div > div.panel.has--border'
    @checkout_checkout_proceed_button_path = '.btn--checkout-proceed'
    @checkout_registerform_path = '#registration'
    @checkout_registerform_prefix_path = '.register--personal > div > div.register--salutation.field--select'
    @checkout_registerform_firstname_path = '#firstname'
    @checkout_registerform_lastname_path = '#lastname'
    @checkout_registerform_department_path = '#register_billing_department'
    @checkout_registerform_taxvat_path = '#register_billing_ustid'
    @checkout_registerform_customernumber_path = '#register_billing_customernumber'
    @checkout_registerform_email_path = '#register_personal_email'
    @checkout_registerform_skip_path = '#register_personal_skipLogin'
    @checkout_registerform_phone_path = '#phone'
    @checkout_registerform_company_path = '#register_billing_company'
    @checkout_registerform_street_path = '#street'
    @checkout_registerform_streetnumber_path = '#emgroup_house_number'
    @checkout_registerform_postcode_path = '#zipcode'
    @checkout_registerform_city_path = '#city'
    @checkout_registerform_country_path = 'div.panel.register--address > div > div.register--country.field--select'
    @checkout_registerform_button_path = 'div.register--action > button'
    @checkout_payment_form_path = '.shipping-payment--information'
    @checkout_payment_options_path = '.shipping-payment--information > div:nth-child(1) > div > div'
    @checkout_delivery_options_path = '.shipping-payment--information > div:nth-child(2) > div > div'
    @checkout_paymentInAdvance_radio_path = '#payment_mean5'
    @checkout_payment_continue_path = 'div > div.confirm--actions.table--actions.block > button'
    @checkout_payment_delivery_standard_radio_path = '.dispatch--method .radio.auto_submit'
    @checkout_order_success_teaser_path = '.finish--teaser'
    @checkout_checkout_buy_button_path = '.btn--checkout-proceed'
    @account_accountinfo_payment_options_path = '.payment--method'
    @account_accountinfo_payment_radio_path = '.radio'
    @account_accountinfo_payment_label_path ='.method--label'
    update_pathes
  end

  def update_pathes
    #give vars of enviroment to local vars
    @env_country ||= VARS_ENV.r_country
    @env_system ||= VARS_ENV.r_system
    @env_shop ||= VARS_ENV.r_shop
    @checkout_agb_container_path = '.tos--panel' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @checkout_orderbutton_path = '.actions--bottom > div > button' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @checkout_panel_path = '.panel.has--border > div > .table--header' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/it/)
    @checkout_panel_path = '.panel.has--border' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    #@checkout_paymentInAdvance_radio_path = '#payment_mean3' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/es/)
    @checkout_payment_delivery_standard_radio_path = ".dispatch--method > div > .radio.auto_submit" if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/de/)
    @checkout_checkout_buy_button_path = '.confirm--actions.table--actions.block > button' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/)
  end

end
