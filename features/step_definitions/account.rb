#account
Given(/^I am on the registration page$/) do
  #var
  url = "#{settings.urlHttps}account"

  #go to url
  visit_secure(url)
  VARS_ENV.url_account = url
  block_css('.navigation-main')
end

Given(/^I register an user by api$/) do
  customernumber = account[:data].customer_number
  email = account[:data].eMail
  firstname = account[:data].firstname
  lastname = account[:data].lastname
  prefix = account[:data].prefix
  salutation = convert_salutation_conform_to_db(prefix)
  password = account[:data].password
  street = account[:data].street
  city = account[:data].city
  zipcode = account[:data].postcode
  country = account[:data].country
  shopware.setDigest(ENV['SHOPWARE_USERNAME'], ENV['SHOPWARE_PASSWORD'], settings.urlBackend)
  customer_id = shopware.getCustomerIdByMail(email)
  if customer_id.is_a?(String)
    shopware.setCustomerAttributes(customernumber, email, firstname, lastname, salutation, password, account[:data].convert_countryname_to_shopId(country), street, city, zipcode, convert_countryname_to_countryid(country))
    shopware.getCustomerIdByMail(email)
  else
    puts "#{customer_id}"
  end
end

And(/^no user account with my email exists$/) do
  eMail = account[:data].eMail
  puts "UrlBackend:#{settings.urlBackend}"
  puts "user eMail:#{eMail}"
  shopware.setDigest(ENV['SHOPWARE_USERNAME'], ENV['SHOPWARE_PASSWORD'], settings.urlBackend)
  shopware.deleteCustomerByMail(eMail)
end

Given(/^I already created an user account$/) do
  eMail = account[:data].eMail
  shopware.setDigest(ENV['SHOPWARE_USERNAME'], ENV['SHOPWARE_PASSWORD'], settings.urlBackend)
  customer_id_determined = shopware.getCustomerIdByMail(eMail)
  puts "customer_id_determined: #{customer_id_determined}"
  if customer_id_determined.is_a?(String)
    puts "-> no unique account with customer:#{eMail} exists"
    step('I register an user by api')
    # puts "I am on the registration page"
    # step("I am on the registration page")
    # puts "I create a new account with my data"
    # step("I create a new account with my data")
    # puts "I should be on my account page"
    # step("I should be on my account page")
    # puts "I log me out"
    # step("I log me out")
    # puts "I am on the registration page"
    # step("I am on the registration page")
  else
    puts   "-> there exists an unique account"
  end
end

When(/^I touch the box to create an new account$/) do
  #csspathes
  account_registerform_accordion_new_path = account[:pathes].account_registerform_accordion_new_path
  checkout_registerform_firstname_path = account[:pathes].checkout_registerform_firstname_path

  # check if path accordion is already clicked
  if (page.has_no_css?(checkout_registerform_firstname_path))
    puts "-> click Accordion"
    find_secure(account_registerform_accordion_new_path)
    element = find_secure(account_registerform_accordion_new_path)
    element.click
  else
    puts "> Accordion is already open"
  end
end

When(/^I touch the box for login$/) do
  account_registerform_accordion_login_path = account[:pathes].account_registerform_accordion_login_path

  find_secure(account_registerform_accordion_login_path)
  element = find_secure(account_registerform_accordion_login_path)
  element.click
end

When(/^I create a new account with my data$/) do
  #var
  prefix = account[:data].prefix
  firstname = account[:data].firstname
  lastname = account[:data].lastname
  department = account[:data].department
  taxid = account[:data].taxid
  taxvat = account[:data].taxvat
  email = account[:data].eMail
  customer_number = account[:data].customer_number
  password = account[:data].password
  phone = account[:data].telephone
  company = account[:data].company
  company_kind = account[:data].company_kind
  street = account[:data].street
  streetnumber = account[:data].streetnumber
  postcode = account[:data].postcode
  city = account[:data].city
  country = account[:data].country
  country_area = account[:data].country_area

  #path
  account_registerform_path = account[:pathes].account_registerform_path
  account_registerform_prefix_path = account[:pathes].account_registerform_prefix_path
  account_registerform_firstname_path = account[:pathes].account_registerform_firstname_path
  account_registerform_lastname_path = account[:pathes].account_registerform_lastname_path
  account_registerform_department_path = account[:pathes].account_registerform_department_path
  account_registerform_taxid_path = account[:pathes].account_registerform_taxid_path
  account_registerform_taxvat_path = account[:pathes].account_registerform_taxvat_path
  account_registerform_customernumber_path = account[:pathes].account_registerform_customernumber_path
  account_registerform_email_path = account[:pathes].account_registerform_email_path
  account_registerform_password_path = account[:pathes].account_registerform_password_path
  account_registerform_phone_path = account[:pathes].account_registerform_phone_path
  account_registerform_company_path = account[:pathes].account_registerform_company_path
  account_registerform_checkbox_company_path = account[:pathes].account_registerform_checkbox_company_path
  account_registerform_street_path = account[:pathes].account_registerform_street_path
  account_registerform_streetnumber_path = account[:pathes].account_registerform_streetnumber_path
  account_registerform_postcode_path = account[:pathes].account_registerform_postcode_path
  account_registerform_city_path = account[:pathes].account_registerform_city_path
  account_registerform_country_path = account[:pathes].account_registerform_country_path
  account_registerform_countryarea_path = account[:pathes].account_registerform_countryarea_path
  account_registerform_button_path = account[:pathes].account_registerform_button_path
  navigation_hover_breadcrumb_path = account[:pathes].navigation_hover_breadcrumb_path

  #search for field, so you know that we are on the right site
  find_secure(account_registerform_path)
  registerform = find_secure(account_registerform_path)

  #if mobile
  if (ENV['BROWSER'] == 'iPhone')
    step("I touch the box to create an new account")
  end

  #set value for prefix
  if (VARS_ENV.r_country == 'no') || (VARS_ENV.r_country == 'se')
    if (page.has_no_css?(account_registerform_prefix_path))
      puts "There is no prefix"
    else
      element = find_secure(account_registerform_prefix_path)
      element.select(prefix)
      printValue(:prefix, binding)
    end
  else
    element = find_secure(account_registerform_prefix_path)
    element.select(prefix)
    printValue(:prefix, binding)
  end
  #set value for firstname
  form_set_value(registerform, "firstname", firstname, account_registerform_firstname_path)
  #set value for lastname
  #registerform.find_secure(account_registerform_lastname_path).set(lastname)
  form_set_value(registerform, "lastname", lastname, account_registerform_lastname_path)
  #set value for customernumber
  form_set_value(registerform, "customernumber", customer_number, account_registerform_customernumber_path)
  #set value for email
  form_set_value(registerform, "email", email, account_registerform_email_path)
  #set value for password
  form_set_value(registerform, "password", password, account_registerform_password_path)
  #set value for phone
  form_set_value(registerform, "phone", phone, account_registerform_phone_path)
  #set value for company
  form_set_value(registerform, "company", company, account_registerform_company_path)
  #click on kind of company if the box should be visible
  if company_kind
    element = find_secure(account_registerform_checkbox_company_path)
    element.click
    puts 'chose company'
  end
  #set value for department
  form_set_value(registerform, "department", department, account_registerform_department_path)
  #set value of taxid
  form_set_value(registerform, "taxid", taxid, account_registerform_taxid_path)
  #set value for vat
  form_set_value(registerform, "taxvat", taxvat, account_registerform_taxvat_path)
  #set value for street
  form_set_value(registerform, "street", street, account_registerform_street_path)
  #set streetnumber
  form_set_value(registerform, "streetnumber", streetnumber, account_registerform_streetnumber_path)
  #set value for postcode
  form_set_value(registerform, "postcode", postcode, account_registerform_postcode_path)
  #set value for city
  form_set_value(registerform, "city", city, account_registerform_city_path)
  #set value for country
  form_set_dropdown("country", country, account_registerform_country_path)
  #set value for country_area 
  form_set_dropdown("country_area", country_area, account_registerform_countryarea_path)

  #click button
  find_secure(account_registerform_button_path).click
  puts "clicked button to continue"

  #check for success
  if (VARS_ENV.r_country == 'no') || (VARS_ENV.r_country == 'se')
    account_registerform_vallidation_modal_path = '.replyGoogleMapsAddressValidation'
    if (page.has_css?(account_registerform_vallidation_modal_path))
      puts "There is a popup!"
    else
      find_secure(navigation_hover_breadcrumb_path)
      puts "I am on #{current_url}"
    end
  end

end

Then(/^I should be on my account page$/) do
  #var
  account_accountpage_welcome_path = account[:pathes].account_accountpage_welcome_path

  if (VARS_ENV.r_country == 'no') || (VARS_ENV.r_country == 'se')
    account_registerform_vallidation_modal_path = '.replyGoogleMapsAddressValidation'
    account_registerform_vallidation_ignore_path = '.modal-ignore'
    if (page.has_css?(account_registerform_vallidation_modal_path))
      puts "found popup"
      find_secure(account_registerform_vallidation_ignore_path).click
      puts "--> closed popup"
    else
      puts "In #{VARS_ENV.r_country} is no popup"
    end
  end
  puts "current_url:#{current_url}"
  find_secure(account_accountpage_welcome_path)
end

When(/^I login with valid informations$/) do
  #var1
  email = account[:data].eMail
  password = account[:data].password
  url_account = settings.urlHttps+'account'

  #path
  homepage_content_logo_path = account[:pathes].homepage_content_logo_path
  account_registerform_login_path = account[:pathes].account_registerform_login_path
  account_registerform_accordion_login_path = account[:pathes].account_registerform_accordion_login_path
  account_loginform_emailfield_path = account[:pathes].account_loginform_emailfield_path
  account_loginform_passwordfield_path = account[:pathes].account_loginform_passwordfield_path
  account_loginform_registerbutton_path = account[:pathes].account_loginform_registerbutton_path
  account_accountpage_welcome_path = account[:pathes].account_accountpage_welcome_path
  navigation_hover_breadcrumb_path = account[:pathes].navigation_hover_breadcrumb_path

  if (current_url == VARS_ENV.url_account)
    puts "> ok, I am on #{current_url}"
  else
    visit_secure(url_account)
    #mobile
    if (ENV['BROWSER'] == 'iPhone')
      if (page.has_css?(account_registerform_accordion_login_path))
        puts "I touch the box for login"
        step("I touch the box for login")
      else
        puts "> Nothing to do"
        puts "I am on #{current_url}"
      end
    end
    #hide
    block_css('.navigation-main')
    # ensure that page is loaded completely
    #find_secure(homepage_content_logo_path)
  end
  if (page.has_no_css?(account_accountpage_welcome_path))
    # ensure that page is loaded completely
    find_secure(homepage_content_logo_path)
    #search for field, so you know that we are on the right site
    login_form = find_secure(account_registerform_login_path)
    #set value for mail
    form_set_value(login_form, "email", email, account_loginform_emailfield_path)
    #set value for password
    form_set_value(login_form, "password", password, account_loginform_passwordfield_path)
    #click button
    find_secure(account_loginform_registerbutton_path).click
    puts "--> pushed button for registration"
  else
    puts "> and I am already be in my account"
  end
  #check for success
  #find_secure(navigation_hover_breadcrumb_path)
end

Given(/^I am logged in$/) do
  #pathes
  account_registerform_accordion_login_path = account[:pathes].account_registerform_accordion_login_path

  if (ENV['BROWSER'] == 'iPhone')
    if (page.has_css?(account_registerform_accordion_login_path))
      puts "I touch the box for login"
      step("I touch the box for login")
    else
      puts "> Nothing to do"
      puts "I am on #{current_url}"
    end
  end
  puts "I already created an user account"
  step ("I already created an user account")
  puts "I login with valid informations"
  step ("I login with valid informations")
  puts "I should be on my account page"
  step ("I should be on my account page")
end

When("I modify my userinfo") do
  puts "I change my password"
  step("I change my password")
  puts "I change my emailaddress"
  step("I change my emailaddress")
  puts "I delete the account with the modified mailadress"
  step("I delete the account with the modified mailadress")
end

When(/^I change my password$/) do
  password = account[:data].password
  password_sec = account[:data].password_sec
  # define css pathes
  account_userinfo_passwordchange_button_appear_path = account[:pathes].account_userinfo_passwordchange_button_appear_path
  account_userinfo_passwordchange_currentpassword_path = account[:pathes].account_userinfo_passwordchange_currentpassword_path
  account_userinfo_passwordchange_newpassword_path = account[:pathes].account_userinfo_passwordchange_newpassword_path
  account_userinfo_passwordchange_repeatnewpassword_path = account[:pathes].account_userinfo_passwordchange_repeatnewpassword_path
  account_userinfo_passwordchange_button_path = account[:pathes].account_userinfo_passwordchange_button_path

  find_secure(account_userinfo_passwordchange_button_appear_path)
  element = find_secure(account_userinfo_passwordchange_button_appear_path)
  element.click
  find_secure(account_userinfo_passwordchange_currentpassword_path)
  element = find_secure(account_userinfo_passwordchange_currentpassword_path)
  element.set(password)
  element = find_secure(account_userinfo_passwordchange_newpassword_path)
  element.set(password_sec)
  element = find_secure(account_userinfo_passwordchange_repeatnewpassword_path)
  element.set(password_sec)
  element = find_secure(account_userinfo_passwordchange_button_path)
  element.click

  puts "--> changed password"
end

When(/^I change my emailaddress$/) do
  eMail_sec = account[:data].eMail_sec
  password_sec = account[:data].password_sec
  # define css pathes
  account_userinfo_emailchange_button_appear_path = account[:pathes].account_userinfo_emailchange_button_appear_path
  account_userinfo_emailchange_currentpassword_path = account[:pathes].account_userinfo_emailchange_currentpassword_path
  account_userinfo_emailchange_newmail_path = account[:pathes].account_userinfo_emailchange_newmail_path
  account_userinfo_emailchange_repeatnewmail_path = account[:pathes].account_userinfo_emailchange_repeatnewmail_path
  account_userinfo_emailchange_button_path = account[:pathes].account_userinfo_emailchange_button_path

  element = find_secure(account_userinfo_emailchange_button_appear_path)
  element.click
  find_secure(account_userinfo_emailchange_currentpassword_path)
  element = find_secure(account_userinfo_emailchange_currentpassword_path)
  element.set(password_sec)
  element = find_secure(account_userinfo_emailchange_newmail_path)
  element.set(eMail_sec)
  element = find_secure(account_userinfo_emailchange_repeatnewmail_path)
  element.set(eMail_sec)
  element = find_secure(account_userinfo_emailchange_button_path)
  element.click
  puts "--> changed emailaddress"
end

Then(/^I should see a confirmation hint$/) do
  account_userinfo_success_hint_path = account[:pathes].account_userinfo_success_hint_path
  if (VARS_ENV.r_country == 'no') || (VARS_ENV.r_country == 'se')
    puts "There is no hint"
  else
      # account_registerform_vallidation_modal_path = '.replyGoogleMapsAddressValidation'
      # if (page.has_css?(account_registerform_vallidation_modal_path))
        # puts "There is a popup!"
      # else
        find_secure(account_userinfo_success_hint_path)
        puts "> found info for success"
        expect(page).to have_css(account_userinfo_success_hint_path),
              "Expect to find a hint for success, but account_userinfo_success_hint_path is not available"
      # end
  end
end

Then(/^I should see an alert for creating a new address$/) do
  account_userinfo_success_hint_path = account[:pathes].account_userinfo_success_hint_path

  if (VARS_ENV.r_country == 'no') || (VARS_ENV.r_country == 'se')
    puts "in #{VARS_ENV.r_country} there is no prefix"
  else
    find_secure(account_userinfo_success_hint_path)
    puts "> found info for success"

    expect(page).to have_css(account_userinfo_success_hint_path),
       "Expect to find a hint for success, but account_userinfo_success_hint_path is not available"
  end
end

Then(/^I should see a new window to manage my addresses$/) do
  account_userinfo_modal_adressmanager_path = account[:pathes].account_userinfo_modal_adressmanager_path

  find_secure(account_userinfo_modal_adressmanager_path)
  puts "found modal window of adressmanager"
end

When(/^I delete the account with the modified mailadress$/) do
  eMail = account[:data].eMail_sec

  #key = "email"
  shopware.setDigest(ENV['SHOPWARE_USERNAME'], ENV['SHOPWARE_PASSWORD'], settings.urlBackend)
  shopware.deleteCustomerByMail(eMail)

end

When(/^I log me out$/) do
  #css pathes
  start_url = current_url
  account_accountinfo_menucontainer_logout_link_path = account[:pathes].account_accountinfo_menucontainer_logout_link_path

  if (ENV['BROWSER'] == 'iPhone')
    puts 'With mobile device use a trick to logout because the way of the menu is too complex'
    url = start_url + '/logout'
    visit_secure(url)
  else
    find_secure(account_accountinfo_menucontainer_logout_link_path).click
    puts "--> logged me out"
  end
end

When(/^I modify my paymentinfo$/) do
  #css pathes
  account_accountinfo_payment_box_path = account[:pathes].account_accountinfo_payment_box_path
  account_accountinfo_paymentchange_button_appear_path = account[:pathes].account_accountinfo_paymentchange_button_appear_path

  find_secure(account_accountinfo_payment_box_path)
  account_accountinfo_payment_box = find_secure(account_accountinfo_payment_box_path)
  # on the next step i can not use find_secure because i do not search on the page but on the paymentbox -> net::ReadTimeout can appear
  # solution build a rescue block around the step
  find_secure_counter ||= 0
  begin
    find_secure_counter = find_secure_counter + 1
    element = account_accountinfo_payment_box.find(account_accountinfo_paymentchange_button_appear_path)
  rescue Net::ReadTimeout => e
    puts "\033[35m#{e.inspect}\033[0m\n"
    sleep 1
    puts "visit_secure"
    puts "visit #{url} again"
    visit(url)
    Capybara.default_max_wait_time = 20
    puts "Failed to visit #{current_url}, retry #{find_secure_counter}"
    find_secure_counter <= 2 ? retry : raise
  end
  element.click
  puts "--> clicked button for change of payment"

  puts "I change option of payment"
  step("I change option of payment")

end

When(/^I change option of payment$/) do
  account_payment_paymentoptions_path = account[:pathes].account_payment_paymentoptions_path
  account_payment_cashOnDelivery_path = account[:pathes].account_payment_cashOnDelivery_path
  account_payment_change_button_path = account[:pathes].account_payment_change_button_path

  find_secure(account_payment_paymentoptions_path)
  element = find_secure(account_payment_cashOnDelivery_path, page.html)
  element.click
  puts "--> choose checkbox for cash on delivery"
  find_secure(account_payment_change_button_path).click
end

When(/^I modify my address for my bill$/) do
  url = current_url
  #css pathes
  account_accountinfo_billaddress_box_path = account[:pathes].account_accountinfo_billaddress_box_path
  account_accountinfo_billaddresschange_button_appear_path = account[:pathes].account_accountinfo_billaddresschange_button_appear_path

  find_secure(account_accountinfo_billaddress_box_path)
  account_accountinfo_billaddresschange_box = find_secure(account_accountinfo_billaddress_box_path)
  find_secure_counter ||= 0
  begin
    find_secure_counter = find_secure_counter + 1
    element = account_accountinfo_billaddresschange_box.find(account_accountinfo_billaddresschange_button_appear_path)
  rescue Net::ReadTimeout => e
    puts "\033[35m#{e.inspect}\033[0m\n"
    sleep 1
    puts "visit_secure"
    puts "visit #{url} again"
    visit(url)
    Capybara.default_max_wait_time = 20
    puts "Failed to visit #{current_url}, retry #{find_secure_counter}"
    find_secure_counter <= 2 ? retry : raise
  end

  close_popup("#close-dpe-shopwide", 3)
  element.click

  puts "I change prefix of my address for invoice"
  step("I change prefix of my address for invoice")
end

When(/^I change prefix of my address for invoice$/) do
  prefix = account[:data].prefix_sec

  account_invoiceadresschange_form_prefix_path = account[:pathes].account_invoiceadresschange_form_prefix_path
  account_invoiceadresschange_button_path = account[:pathes].account_invoiceadresschange_button_path

  if (VARS_ENV.r_country == 'no') || (VARS_ENV.r_country == 'se')
    puts "in #{VARS_ENV.r_country} there is no prefix"
  else
    #set value for prefix
    find_secure(account_invoiceadresschange_form_prefix_path)
    form_set_dropdown("prefix", prefix, account_invoiceadresschange_form_prefix_path)
    puts "has set dropdown"
    element = find_secure(account_invoiceadresschange_button_path)#.click
    puts "found secure"
    click_secure(element)
    puts "--> click change-button"
  end
end

When(/^I add a new address$/) do
  # define variables
  prefix = account[:data].prefix_sec
  firstname = account[:data].firstname
  lastname = account[:data].lastname
  phone = account[:data].telephone
  company = account[:data].company
  street = account[:data].street
  streetnumber = account[:data].streetnumber
  postcode = account[:data].postcode
  city = account[:data].city
  country = account[:data].country

  # define css pathes
  account_address_create_path = account[:pathes].account_address_create_path
  account_address_prefix_path = account[:pathes].account_address_prefix_path
  account_address_firstname_path = account[:pathes].account_address_firstname_path
  account_address_lastname_path = account[:pathes].account_address_lastname_path
  account_address_phone_path = account[:pathes].account_address_phone_path
  account_address_company_path = account[:pathes].account_address_company_path
  account_address_street_path = account[:pathes].account_address_street_path
  account_address_streetnumber_path = account[:pathes].account_address_streetnumber_path
  account_address_postcode_path = account[:pathes].account_address_postcode_path
  account_address_city_path = account[:pathes].account_address_city_path
  account_address_country_path = account[:pathes].account_address_country_path
  account_address_savebutton_path = account[:pathes].account_address_savebutton_path

  find_secure(account_address_create_path)
  puts "> found formular to add a new address"
  account_addressform = find_secure(account_address_create_path)
  #select prefix
  form_set_dropdown("prefix", prefix, account_prefix_path)
  #set value for firstname
  form_set_value(account_addressform, "firstname", firstname, account_address_firstname_path)
  #set value for lastname
  form_set_value(account_addressform, "lastname", lastname, account_address_lastname_path)
  #set value for phone
  form_set_value(account_addressform, "phone", phone, account_address_phone_path)
  #set value for company
  form_set_value(account_addressform, "company", company, account_address_company_path)
    #set value for street
  form_set_value(account_addressform, "street", street, account_address_street_path)
  #set streetnumber
  form_set_value(account_addressform, "streetnumber", streetnumber, account_address_streetnumber_path)
  #set value for postcode
  form_set_value(account_addressform, "postcode", postcode, account_address_postcode_path)
  #set value for city
  form_set_value(account_addressform, "city", city, account_address_city_path)
  #set value for country
  form_set_dropdown(account_addressform, "country", country, account_address_country_path)
  #click button for taking action
  account_addressform.find_secure(account_address_savebutton_path).click
  puts "> clicked button to save address"
end

When(/^I modify my address for my delivery/) do
  #css pathes
  account_accountinfo_deliveraddress_box_path = account[:pathes].account_accountinfo_deliveraddress_box_path
  account_accountinfo_deliveraddresschange_button_appear_path = account[:pathes].account_accountinfo_deliveraddresschange_button_appear_path

  find_secure(account_accountinfo_deliveraddress_box_path)
  account_accountinfo_deliveraddresschange_box = find_secure(account_accountinfo_deliveraddress_box_path)
  find_secure_counter ||= 0
  begin
    find_secure_counter = find_secure_counter + 1
    element = account_accountinfo_deliveraddresschange_box.find(account_accountinfo_deliveraddresschange_button_appear_path)
  rescue Net::ReadTimeout => e
    puts "\033[35m#{e.inspect}\033[0m\n"
    sleep 1
    puts "visit_secure"
    puts "visit #{url} again"
    visit(url)
    Capybara.default_max_wait_time = 20
    puts "Failed to visit #{current_url}, retry #{find_secure_counter}"
    find_secure_counter <= 2 ? retry : raise
  end

  element.click
  puts "--> clicked button for change the adress for delivery"
  #puts "I change prefix of my address for delivery"
  #step("I change prefix of my address for delivery")
end

When(/^I change prefix of my address for delivery$/) do
  prefix = account[:data].prefix_sec

  if (VARS_ENV.r_country == 'no') || (VARS_ENV.r_country == 'se')
    puts "in #{VARS_ENV.r_country} there is no prefix"
  else
    account_deliveradresschange_form_prefix_path = account[:pathes].account_deliveradresschange_form_prefix_path
    account_deliveradresschange_button_path = account[:pathes].account_deliveradresschange_button_path
    #set value for prefix
    find_secure(account_deliveradresschange_form_prefix_path)
    form_set_dropdown("prefix", prefix, account_deliveradresschange_form_prefix_path)
    puts "--> select prefix:#{prefix}"
    find_secure(account_deliveradresschange_button_path).click
    puts "--> click change-button"
  end
end

#it is not working on pulsiva
When(/^I activate the newsletterbox$/) do
  #if (VARS_ENV.r_shop == 'chefworks')
    account_newsletter_box_path = account[:pathes].account_newsletter_box_path
    find_secure(account_newsletter_box_path)
    find_secure(account_newsletter_box_path).click
    puts "--> activate the checkbox"
  #else
    puts "On the shop of #{VARS_ENV.r_shop} this feature does not exist"
  #end
end

#it is not implemented
When(/^I get all items of the sidebar$/) do
  account_sidebar_path = account[:pathes].account_sidebar_path

  find_secure(account_sidebar_path)
  account_sidebar_menuitems = find_secure(account_sidebar_path).all('li a')
  puts "> menuitems:#{account_sidebar_menuitems.size}"
  account_sidebar_menuitems.each {
    |x|
    account_sidebar_menuitems_href = /\b[a-z]*\z\b/.match(x[:href])
    puts "- #{account_sidebar_menuitems_href}"
  }
end

Given(/^I already created an user account on Vega in DE$/) do
  shop = VARS_ENV.r_shop
  country = VARS_ENV.r_country
  if ( (shop == 'vega') && (country == 'de') )
    eMail = account[:data].eMail
    shopware.setDigest(ENV['SHOPWARE_USERNAME'], ENV['SHOPWARE_PASSWORD'], settings.urlBackend)
    customer_id_determined = shopware.getCustomerIdByMail(eMail)
    if customer_id_determined.is_a?(String)
      puts "-> no unique account with customer:#{eMail} exists"
      puts "I am on the registration page"
      step("I am on the registration page")
      puts "I create a new account with my data"
      step("I create a new account with my data")
      puts "I should be on my account page"
      step("I should be on my account page")
      puts "I log me out"
      step("I log me out")
      puts "I am on the registration page"
      step("I am on the registration page")
    else
      puts   "-> there exists an unique account"
    end
  else
    puts "in #{country} on #{shop} skip this step"
  end

end

When(/^I login with valid informations on Jobeline in DE$/) do
  shop = VARS_ENV.r_shop
  country = VARS_ENV.r_country
  if ( (shop == 'vega') && (country == 'de') )
    #var1
    email = account[:data].eMail
    password = account[:data].password
    url_account = 'https://www.jobeline.com/de-de/account'

    #path
    homepage_content_logo_path = account[:pathes].homepage_content_logo_path
    account_registerform_login_path = account[:pathes].account_registerform_login_path
    account_registerform_accordion_login_path = account[:pathes].account_registerform_accordion_login_path
    account_loginform_emailfield_path = account[:pathes].account_loginform_emailfield_path
    account_loginform_passwordfield_path = account[:pathes].account_loginform_passwordfield_path
    account_loginform_registerbutton_path = account[:pathes].account_loginform_registerbutton_path
    account_accountpage_welcome_path = account[:pathes].account_accountpage_welcome_path
    navigation_hover_breadcrumb_path = account[:pathes].navigation_hover_breadcrumb_path

    if (current_url == url_account)
      puts "> ok, I am on #{current_url}"
    else
      puts "--> go to #{url_account}"
      visit_secure(url_account)
      #mobile
      if (ENV['BROWSER'] == 'iPhone')
        if (page.has_css?(account_registerform_accordion_login_path))
          puts "I touch the box for login"
          step("I touch the box for login")
        else
          puts "> Nothing to do"
          puts "I am on #{current_url}"
        end
      end
      #hide
      block_css('.navigation-main')
      # ensure that page is loaded completely
      find_secure(homepage_content_logo_path)
    end
    if (page.has_no_css?(account_accountpage_welcome_path))
      # ensure that page is loaded completely
      find_secure(homepage_content_logo_path)
      #search for field, so you know that we are on the right site
      find_secure(account_registerform_login_path)
      login_form = find_secure(account_registerform_login_path)
      #set value for mail
      form_set_value(login_form, "email", email, account_loginform_emailfield_path)
      puts "-> set email"
      #set value for password
      form_set_value(login_form, "password", password, account_loginform_passwordfield_path)
      puts "-> set password"
      #click button
      find_secure(account_loginform_registerbutton_path).click
      puts "--> pushed button for registration"
    else
      puts "> and I am already be in my account"
    end
  else
    puts "in #{country} on #{shop} skip this step"
  end
end

When(/^I login with valid informations on Vega in AT$/) do
  shop = VARS_ENV.r_shop
  country = VARS_ENV.r_country
  if ( (shop == 'vega') && (country == 'de') )
    #var1
    email = account[:data].eMail
    password = account[:data].password
    url_account = 'https://www.vega-direct.com/at-de/account'

    #path
    homepage_content_logo_path = account[:pathes].homepage_content_logo_path
    account_registerform_login_path = account[:pathes].account_registerform_login_path
    account_registerform_accordion_login_path = account[:pathes].account_registerform_accordion_login_path
    account_loginform_emailfield_path = account[:pathes].account_loginform_emailfield_path
    account_loginform_passwordfield_path = account[:pathes].account_loginform_passwordfield_path
    account_loginform_registerbutton_path = account[:pathes].account_loginform_registerbutton_path
    account_accountpage_welcome_path = account[:pathes].account_accountpage_welcome_path
    navigation_hover_breadcrumb_path = account[:pathes].navigation_hover_breadcrumb_path

    if (current_url == url_account)
      puts "> ok, I am on #{current_url}"
    else
      puts "--> go to #{url_account}"
      visit_secure(url_account)
      #mobile
      if (ENV['BROWSER'] == 'iPhone')
        if (page.has_css?(account_registerform_accordion_login_path))
          puts "I touch the box for login"
          step("I touch the box for login")
        else
          puts "> Nothing to do"
          puts "I am on #{current_url}"
        end
      end
      #hide
      block_css('.navigation-main')
      # ensure that page is loaded completely
      find_secure(homepage_content_logo_path)
    end
    if (page.has_no_css?(account_accountpage_welcome_path))
      # ensure that page is loaded completely
      find_secure(homepage_content_logo_path)
      #search for field, so you know that we are on the right site
      find_secure(account_registerform_login_path)
      login_form = find_secure(account_registerform_login_path)
      #set value for mail
      form_set_value(login_form, "email", email, account_loginform_emailfield_path)
      puts "-> set email"
      #set value for password
      form_set_value(login_form, "password", password, account_loginform_passwordfield_path)
      puts "-> set password"
      #click button
      find_secure(account_loginform_registerbutton_path).click
      puts "--> pushed button for registration"
    else
      puts "> and I am already be in my account"
    end
  else
    puts "in #{country} on #{shop} skip this step"
  end
end

Then(/^I should get an errormessage$/) do
  shop = VARS_ENV.r_shop
  country = VARS_ENV.r_country
  if ( (shop == 'vega') && (country == 'de') )
    logo_path = account[:pathes].homepage_content_logo_path
    errormessage_path = account[:pathes].account_login_errormessage_path

    page.find(logo_path)
    page.find(errormessage_path)
    puts "> found errormessage on #{current_url}"
  else
    puts "in #{country} on #{shop} skip this step"
  end
end

Then(/^I should be on my account page on the subshop$/) do
  shop = VARS_ENV.r_shop
  country = VARS_ENV.r_shop
  if ( (shop == 'vega') && (country == 'de') )
    #var
    step("I should be on my account page")
  else
    puts "in #{country} on #{shop} skip this step"
  end
end

When(/^I am looking for all different paymentmethods on the account$/) do
  url_payments = "#{settings.urlHttps}account/payment"
  account_accountinfo_payment_options_path = account[:pathes].account_accountinfo_payment_options_path
  account_accountinfo_paymentchange_button_appear_path = account[:pathes].account_accountinfo_paymentchange_button_appear_path

  if (VARS_ENV.r_shop == 'vega' || VARS_ENV.r_shop == 'v_jobeline')
    puts "On #{VARS_ENV.r_shop} first i have to add an product to cart"
    step("I add an article to my cart by ajax")
  end
  visit_secure(url_payments)
  #puts "#{account_accountinfo_payment_options_path}"
  payment_options = page.all(account_accountinfo_payment_options_path, visible: true)
  payment_options.each do |payment|
    payment_txt = payment.text
    puts payment_txt
    # do not use click_label_of_xpath_from_element because it takes too long time
    if ENV['TAG'] == 'account_payment_info'
      puts "If I use the tag '#{ENV['TAG']}' I will check if each payment can be choosen"
      #click_label_of_xpath_from_element(payment)
    end
    VARS_ENV.paymentmethods << payment_txt
  end
end

Then(/^I should see all possibilities of payoptions$/) do
  payment_methods = account[:data].payment_methods
  #insert if case
  if compare_values_of_arrays(payment_methods, VARS_ENV.paymentmethods)
    puts "all paymentmethods are shown"
  else
    !exit #exit(0) instead of exit(1) = 0 means break but all is ok
  end
end
