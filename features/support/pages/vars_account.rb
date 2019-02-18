#account
class Csspathes_Account
  attr_accessor :homepage_content_logo_path, :navigation_hover_breadcrumb_path, :checkout_registerform_firstname_path,
                :account_registerform_path, :account_registerform_accordion_new_path, :account_registerform_accordion_login_path, :account_registerform_login_path,
                :account_registerform_prefix_path, :account_registerform_firstname_path, :account_registerform_lastname_path, :account_registerform_department_path, :account_registerform_taxid_path,
                :account_registerform_taxvat_path, :account_registerform_email_path, :account_registerform_password_path, :account_registerform_phone_path, :account_registerform_company_path,
                :account_registerform_checkbox_company_path, :account_registerform_street_path, :account_registerform_streetnumber_path, :account_registerform_postcode_path,
                :account_registerform_city_path, :account_registerform_country_path, :account_registerform_countryarea_path, :account_registerform_button_path, :account_accountpage_welcome_path, :account_accountpage_info_path, :account_loginform_emailfield_path, :account_loginform_passwordfield_path,
                :account_loginform_registerbutton_path, :account_userinfo_passwordchange_button_appear_path, :account_userinfo_passwordchange_currentpassword_path, :account_userinfo_passwordchange_newpassword_path, :account_login_errormessage_path,
                :account_userinfo_passwordchange_repeatnewpassword_path, :account_userinfo_passwordchange_button_path, :account_userinfo_emailchange_button_appear_path, :account_userinfo_emailchange_currentpassword_path,
                :account_userinfo_emailchange_newmail_path, :account_userinfo_emailchange_repeatnewmail_path, :account_userinfo_emailchange_button_path, :account_userinfo_success_hint_path, :account_accountinfo_menucontainer_logout_link_path,
                :account_accountinfo_payment_box_path, :account_accountinfo_paymentchange_button_appear_path, :account_payment_paymentoptions_path, :account_payment_cashOnDelivery_path, :account_payment_change_button_path,
                :account_accountinfo_billaddress_box_path, :account_accountinfo_billaddresschange_button_appear_path, :account_invoiceadresschange_form_prefix_path, :account_invoiceadresschange_button_path, :account_accountinfo_deliveraddress_box_path, :account_userinfo_modal_adressmanager_path,
                :account_accountinfo_deliveraddresschange_button_appear_path, :account_deliveradresschange_form_prefix_path, :account_deliveradresschange_button_path, :account_newsletter_box_path, :account_sidebar_path, :account_registerform_customernumber_path,
                :account_address_create_path,  :account_address_prefix_path, :account_address_firstname_path, :account_address_lastname_path, :account_address_phone_path, :account_address_company_path, :account_address_street_path, :account_address_streetnumber_path, :account_address_countryarea_path,
                :account_address_postcode_path, :account_address_city_path, :account_address_standard_path, :account_address_country_path, :account_address_savebutton_path, :account_accountinfo_payment_options_path


  def initialize
    @homepage_content_logo_path = '.logo-main'
    @navigation_hover_breadcrumb_path = '.content--breadcrumb'
    @checkout_registerform_firstname_path = '#firstname'
    @account_registerform_path = '#registration'
    @account_registerform_accordion_new_path = 'section > div > div > div.accordion-container > div.css-accordion-head.btn > label'
    @account_registerform_accordion_login_path = '.content > div > .css-accordion-head.btn > label'
    @account_registerform_login_path = ".register--existing-customer"
    @account_registerform_prefix_path = '.register--personal > div > div.register--salutation.field--select'
    @account_registerform_firstname_path = '#firstname'
    @account_registerform_lastname_path = '#lastname'
    @account_registerform_department_path = '#register_billing_department'
    #umsatzsteuernummer (UID)
    @account_registerform_taxid_path = '#register_billing_vatid'
    @account_registerform_customernumber_path = '#register_personal_number'
    #handelsregister
    @account_registerform_taxvat_path = '#register_billing_emgroup_commercial_register_nr'
    @account_registerform_email_path = '#register_personal_email'
    @account_registerform_password_path = '#register_personal_password'
    @account_registerform_phone_path = '#phone'
    @account_registerform_company_path = '#register_billing_company'
    @account_registerform_checkbox_company_path = '#register_billing_emgroup_business_form_other'
    @account_registerform_street_path = '#street'
    @account_registerform_streetnumber_path = '#emgroup_house_number'
    @account_registerform_postcode_path = '#zipcode'
    @account_registerform_city_path = '#city'
    @account_registerform_country_path = 'div.panel.register--address > div > div.register--country.field--select'
    @account_registerform_countryarea_path = 'div.panel.register--address > div > div.register--country.field--select'
    @account_registerform_button_path = 'div.register--action > button'
    @account_address_create_path = '.account--address'
    @account_address_prefix_path = '.address--salutation.field--select > .js--fancy-select'
    @account_address_firstname_path = '#firstname2'
    @account_address_lastname_path = '#lastname2'
    @account_address_phone_path = '#address_emgroup_shipping_phone'
    @account_address_company_path = '#register_billing_company'
    @account_address_street_path = '#street'
    @account_address_streetnumber_path = '#emgroup_house_number'
    @account_address_postcode_path = '#zipcode'
    @account_address_city_path = '#city'
    @account_address_standard_path = '#set_default_shipping'
    @account_address_country_path = '#country'
    @account_address_countryarea_path = '.register--address > div > .country-area-state-selection'
    @account_address_savebutton_path = '.address--form-actions > input'
    @account_accountpage_welcome_path = '.account--welcome.panel'
    @account_accountpage_info_path = '.account--info'
    @account_loginform_emailfield_path = '#email'
    @account_loginform_passwordfield_path = '#passwort'
    @account_loginform_registerbutton_path = '.register--login-action > button'
    @account_userinfo_passwordchange_button_appear_path = '.btn--password'
    @account_userinfo_passwordchange_currentpassword_path = '#currentPassword'
    @account_userinfo_passwordchange_newpassword_path = '#newpwd'
    @account_userinfo_passwordchange_repeatnewpassword_path = '#newpwdrepeat'
    @account_userinfo_passwordchange_button_path = '#account--password > form > div.panel--actions.is--wide > input'
    @account_userinfo_emailchange_button_appear_path = '.btn--email'
    @account_userinfo_emailchange_currentpassword_path = '#emailPassword'
    @account_userinfo_emailchange_newmail_path = '#newmail'
    @account_userinfo_emailchange_repeatnewmail_path = '#neweailrepeat'
    @account_userinfo_emailchange_button_path = '#account--email > form > div.panel--actions.is--wide > input'
    @account_login_errormessage_path = '.account--error > div > div.alert--content'
    @account_userinfo_success_hint_path = '.account--success'
    @account_accountinfo_menucontainer_logout_link_path = '.link--logout'
    @account_accountinfo_payment_box_path = '.account--payment.account--box'
    @account_accountinfo_paymentchange_button_appear_path = '.btn'
    @account_payment_paymentoptions_path = '.register--payment'
    @account_payment_cashOnDelivery_path = '#payment_mean3'
    @account_payment_change_button_path = '.account--actions > input'
    @account_accountinfo_billaddress_box_path = '.account--billing.account--box'
    @account_accountinfo_billaddresschange_button_appear_path = '.panel--actions > a'
    @account_invoiceadresschange_form_prefix_path = '.address-form--panel > div > div.address--salutation.field--select > div'
    @account_invoiceadresschange_button_path = '.address--form-actions > input'
    @account_accountinfo_deliveraddress_box_path = '.account--shipping.account--box'
    @account_accountinfo_deliveraddresschange_button_appear_path = '.account--shipping.account--box.panel > div > a'
    @account_userinfo_modal_adressmanager_path = ".address-manager--modal"
    @account_deliveradresschange_form_prefix_path = '.address-form--panel > div > div.address--salutation.field--select > div'
    @account_deliveradresschange_button_path = '.address--form-actions > input'
    @account_newsletter_box_path = '#newsletter'
    @account_sidebar_path = '.account--menu > div > ul'
    @account_accountinfo_payment_options_path = '.payment--selection-label'
    update_pathes
  end

  def update_pathes
    #give vars of enviroment to local vars
    @env_country ||= VARS_ENV.r_country
    @env_system ||= VARS_ENV.r_system
    @env_shop ||= VARS_ENV.r_shop

    # define hash of countries
    @account_registerform_taxid_path = '#register_billing_emgroup_commercial_register_nr' if "#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/(no|nl)/)
    @account_registerform_taxid_path = '#register_billing_emgroup_commercial_register_nr' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/(no|nl|se)/)
    @account_registerform_taxid_path = '#register_billing_emgroup_commercial_register_nr' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @account_payment_cashOnDelivery_path = '#payment_mean5' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/(ch|fr|no|se)/)
    @account_payment_cashOnDelivery_path = '#payment_mean4' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/(de|fr|be|no|se)/)
    @account_payment_cashOnDelivery_path = '#payment_mean5' if "#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/(de)/)
    @account_payment_cashOnDelivery_path = '#payment_mean4' if "#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/(fr|be|no|se)/)
    @account_accountinfo_billaddresschange_button_appear_path = 'a:nth-child(2)' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @account_invoiceadresschange_form_prefix_path = '.panel.register--personal > div > div.register--salutation.field--select' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @account_invoiceadresschange_button_path = '.account--actions > input' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @account_accountinfo_deliveraddresschange_button_appear_path = 'a:nth-child(2)' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @account_deliveradresschange_form_prefix_path = '.panel.register--shipping > div > div.register--salutation.field--select' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @account_deliveradresschange_button_path = '.account--actions > input' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    #@account_accountinfo_payment_options_path = '.payment--method > .method--label > .method--name' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/at/)
  end

end
