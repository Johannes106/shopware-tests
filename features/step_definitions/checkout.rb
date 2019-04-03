#checkout
Given(/^I am on the checkout page$/) do
  checkout_checkout_proceed_button_path = checkout[:pathes].checkout_checkout_proceed_button_path
  checkout_step_confirm_path = checkout[:pathes].checkout_step_confirm_path

  if (page.has_css?(checkout_step_confirm_path))
    puts "I am already on the final checkout page"
  else
    puts "--> click continue"
    element = find_secure(checkout_checkout_proceed_button_path, match: :first)
    element.click
    if (ENV['BROWSER'] == 'iPhone')
      puts "-> set payment and shipping"
      step("I set payment")
      step("I set shipping")
      step("I click the button to go to the final page on mobile")
    end
  end
  #puts "And the checkoutpage contains all elements"
  #step("the checkoutpage contains all elements")
end

And(/^the checkoutpage contains all elements/) do
  checkout_backbutton_path = checkout[:pathes].checkout_backbutton_path
  checkout_steps_container_path = checkout[:pathes].checkout_steps_container_path
  checkout_agb_container_path = checkout[:pathes].checkout_agb_container_path
  checkout_billing_container_path = checkout[:pathes].checkout_billing_container_path
  checkout_shipping_container_path = checkout[:pathes].checkout_shipping_container_path
  checkout_payment_container_path = checkout[:pathes].checkout_payment_container_path
  checkout_product_container_path = checkout[:pathes].checkout_product_container_path
  checkout_orderbutton_path = checkout[:pathes].checkout_orderbutton_path

  find_secure(checkout_orderbutton_path)

  expect(page).to have_css(checkout_backbutton_path),
    "expected to find #{checkout_backbutton_path}, but the checkout_backbutton is still missing on the page"
  expect(page).to have_css(checkout_steps_container_path),
    "expected to find #{checkout_steps_container_path}, but the checkout_steps_container is still missing on the page"
  expect(page).to have_css(checkout_agb_container_path),
    "expected to find #{checkout_agb_container_path}, but the checkout_agb_container is still missing on the page"
  expect(page).to have_css(checkout_billing_container_path),
    "expected to find #{checkout_billing_container_path}, but the checkout_billing_container is still missing on the page"
  expect(page).to have_css(checkout_shipping_container_path),
    "expected to find #{checkout_shipping_container_path}, but the checkout_shipping_container is still missing on the page"
  expect(page).to have_css(checkout_payment_container_path),
    "expected to find #{checkout_payment_container_path}, but the checkout_payment_container is still missing on the page"
  expect(page).to have_css(checkout_product_container_path),
    "expected to find #{checkout_product_container_path}, but the checkout_product_container is still missing on the page"
  expect(page).to have_css(checkout_orderbutton_path),
    "expected to find #{checkout_orderbutton_path}, but the checkout_orderbutton is still missing on the page"
end

When(/^I register a new account with my data$/) do
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
  checkout_registerform_skip_path = checkout[:pathes].checkout_registerform_skip_path
  account_registerform_password_path = account[:pathes].account_registerform_password_path
  account_registerform_phone_path = account[:pathes].account_registerform_phone_path
  account_registerform_company_path = account[:pathes].account_registerform_company_path
  account_registerform_checkbox_company_path = account[:pathes].account_registerform_checkbox_company_path
  account_registerform_street_path = account[:pathes].account_registerform_street_path
  account_registerform_streetnumber_path = account[:pathes].account_registerform_streetnumber_path
  account_registerform_postcode_path = account[:pathes].account_registerform_postcode_path
  account_registerform_city_path = account[:pathes].account_registerform_city_path
  account_registerform_country_path = account[:pathes].account_registerform_country_path
  account_registerform_countryarea_path = account[:pathes].account_address_countryarea_path
  account_registerform_button_path = account[:pathes].account_registerform_button_path

  #search for field, so you know that we are on the right site
  find_secure(account_registerform_path)
  account_registerform = find_secure(account_registerform_path)
  #set value for prefix
  if (ENV['COUNTRY'] == 'no') || (ENV['COUNTRY'] == 'se')
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
  form_set_value(account_registerform, "firstname", firstname, account_registerform_firstname_path)
  #set value for lastname
  form_set_value(account_registerform, "lastname", lastname, account_registerform_lastname_path)
  #set value for customernumber
  form_set_value(account_registerform, "customernumber", customer_number, account_registerform_customernumber_path)
  #set value for email
  form_set_value(account_registerform, "email", email, account_registerform_email_path)
  #activate checkbox to create an account
  element = find_secure(checkout_registerform_skip_path)
  element.click
  #set value for password
  form_set_value(account_registerform, "password", password, account_registerform_password_path)
  #set value for phone
  form_set_value(account_registerform, "phone", phone, account_registerform_phone_path)
  #set value for company
  form_set_value(account_registerform, "company", company, account_registerform_company_path)
  #click on kind of company if the box should be visible
  if company_kind
    element = find_secure(account_registerform_checkbox_company_path)
    element.click
    puts 'chose company'
  end
  #set value for department
  form_set_value(account_registerform, "department", department, account_registerform_department_path)
  #set value of taxid
  form_set_value(account_registerform, "taxid", taxid, account_registerform_taxid_path)
  #set value for vat
  form_set_value(account_registerform, "taxvat", taxvat, account_registerform_taxvat_path)
  #set value for street
  form_set_value(account_registerform, "street", street, account_registerform_street_path)
  #set streetnumber
  form_set_value(account_registerform, "streetnumber", streetnumber, account_registerform_streetnumber_path)
  #set value for postcode
  form_set_value(account_registerform, "postcode", postcode, account_registerform_postcode_path)
  #set value for city
  form_set_value(account_registerform, "city", city, account_registerform_city_path)
  #set value for country
  form_set_dropdown("country", country, account_registerform_country_path)
  #set value for country_area: jobeline es
  form_set_dropdown("country_area", country_area, account_registerform_countryarea_path)
  #click button
  element = find_secure(account_registerform_button_path)
  element.click
  puts "clicked button to continue"

  if (ENV['COUNTRY'] == 'no') || (ENV['COUNTRY'] == 'se')
    account_registerform_vallidation_modal_path = checkout[:pathes].account_registerform_vallidation_modal_path
    if (page.has_css?(account_registerform_vallidation_modal_path))
      puts "There is a popup!"
    else
      expect(page).to have_no_css(checkout_registerform_skip_path)
        "expected not find '#{checkout_registerform_skip_path}' but it is here"
    end
  end
end


When(/^I send my order$/) do
  checkout_orderbutton_path = checkout[:pathes].checkout_orderbutton_path
  puts "I am on the checkout page"
  step("I am on the checkout page")
  puts "I activate the box of agb"
  step("I activate the box of agb")

  element = find_secure(checkout_orderbutton_path)
  if (ENV['MAKE_ORDER'])
    @made_order=true
    element.click
    puts "--> click orderbutton"
    next
  else
    puts "> found orderbutton but not press"
  end
end

And(/^I activate the box of agb$/) do
  if ENV['SHOP'] == 'chefworks'
    checkout_agb_box_path = checkout[:pathes].checkout_agb_box_path

    element = find_secure(checkout_agb_box_path)
    #element = find_secure(checkout_agb_box_path, match: :first)
    element.click
    puts "-> activate agb"
  else
    puts "> no agbbox is here "
  end
end

When(/^I go to the checkout$/) do
  checkout_panel_path = checkout[:pathes].checkout_panel_path
  checkout_checkout_proceed_button_path = checkout[:pathes].checkout_checkout_proceed_button_path
  navigation_path = checkout[:pathes].navigation_path

  block_css(navigation_path)

  find_secure(checkout_panel_path)
  element = find_secure(checkout_checkout_proceed_button_path, match: :first)
  element.click
  puts "--> click button to continue"
end

When(/^I fill out a register form and send it without creating an account$/) do
    #var
  prefix = account[:data].prefix
  firstname = account[:data].firstname
  lastname = account[:data].lastname
  department = account[:data].department
  taxid = account[:data].taxid
  taxvat = account[:data].taxvat
  customer_number = account[:data].customer_number
  email = account[:data].eMail
  skip = "skip only export and chefworks because this field has different meaning on all other templates of our shops"
  phone = account[:data].telephone
  company = account[:data].company
  company_kind = account[:data].company_kind
  street = account[:data].street
  streetnumber = account[:data].streetnumber
  postcode = account[:data].postcode
  city = account[:data].city
  country = account[:data].country

  #path
  checkout_registerform_path = account[:pathes].account_registerform_path
  checkout_registerform_prefix_path = account[:pathes].account_registerform_prefix_path
  checkout_registerform_firstname_path = account[:pathes].account_registerform_firstname_path
  checkout_registerform_lastname_path = account[:pathes].account_registerform_lastname_path
  checkout_registerform_department_path = account[:pathes].account_registerform_department_path
  checkout_registerform_taxid_path = account[:pathes].account_registerform_taxid_path
  checkout_registerform_taxvat_path = account[:pathes].account_registerform_taxvat_path
  checkout_registerform_customernumber_path = account[:pathes].account_registerform_customernumber_path
  checkout_registerform_email_path = account[:pathes].account_registerform_email_path
  checkout_registerform_skip_path = checkout[:pathes].checkout_registerform_skip_path ####################################################
  checkout_registerform_phone_path = account[:pathes].account_registerform_phone_path
  checkout_registerform_company_path = account[:pathes].account_registerform_company_path
  checkout_registerform_checkbox_company_path = account[:pathes].account_registerform_checkbox_company_path
  checkout_registerform_street_path = account[:pathes].account_registerform_street_path
  checkout_registerform_streetnumber_path = account[:pathes].account_registerform_streetnumber_path
  checkout_registerform_postcode_path = account[:pathes].account_registerform_postcode_path
  checkout_registerform_city_path = account[:pathes].account_registerform_city_path
  checkout_registerform_country_path = account[:pathes].account_registerform_country_path
  checkout_registerform_button_path = account[:pathes].account_registerform_button_path

  #search for field, so you know that we are on the right site
  find_secure(checkout_registerform_path)
  checkout_registerform = find_secure(checkout_registerform_path)
  #set value for prefix
  #set value for prefix
  if (ENV['COUNTRY'] == 'no') || (ENV['COUNTRY'] == 'se')
    if (page.has_no_css?(checkout_registerform_prefix_path))
      puts "There is no prefix"
    else
      element = find_secure(checkout_registerform_prefix_path)
      element.select(prefix)
      printValue(:prefix, binding)
    end
  else
    element = find_secure(checkout_registerform_prefix_path)
    element.select(prefix)
    printValue(:prefix, binding)
  end
  #set value for firstname
  form_set_value(checkout_registerform, "firstname", firstname, checkout_registerform_firstname_path)
  #set value for lastname
  form_set_value(checkout_registerform, "lastname", lastname, checkout_registerform_lastname_path)
  #set value for customernumber
  form_set_value(checkout_registerform, "customernumber", customer_number, checkout_registerform_customernumber_path)
  #set value for email
  form_set_value(checkout_registerform, "email", email, checkout_registerform_email_path)
  #set value to skip registering
  if (ENV['SHOP'] == 'export' || ENV['SHOP'] == 'chefworks')
    element = find_secure(checkout_registerform_skip_path)
    element.click
  end
  #set value for phone
  begin #rescuse in cause of the difference of live and int in chefworks
    form_set_value(checkout_registerform, "phone", phone, checkout_registerform_phone_path)
  rescue Exception => e
    puts e.message
  end
  #set value for company
  form_set_value(checkout_registerform, "company", company, checkout_registerform_company_path)
  #click on kind of company if the box should be visible
  if company_kind
    element = find_secure(checkout_registerform_checkbox_company_path)
    element.click
    puts 'chose company'
  end
  #set value for department
  form_set_value(checkout_registerform, "department", department, checkout_registerform_department_path) #############################################################
  #set value for id
  form_set_value(checkout_registerform, "taxid", taxid, checkout_registerform_taxid_path)
  #set value for vat
  form_set_value(checkout_registerform, "taxvat", taxvat, checkout_registerform_taxvat_path)
  #set value for street
  form_set_value(checkout_registerform, "street", street, checkout_registerform_street_path)
  #set streetnumber
  form_set_value(checkout_registerform, "streetnumber", streetnumber, checkout_registerform_streetnumber_path)
  #set value for postcode
  form_set_value(checkout_registerform, "postcode", postcode, checkout_registerform_postcode_path)
  #set value for city
  form_set_value(checkout_registerform, "city", city, checkout_registerform_city_path)
  #set value for country
  element = find_secure(checkout_registerform_country_path)
  element.select(country)
  #click button
  element = find_secure(checkout_registerform_button_path)
  element.click
  puts "clicked button to continue"

  if (ENV['COUNTRY'] == 'no') || (ENV['COUNTRY'] == 'se')
    account_registerform_vallidation_modal_path = checkout[:pathes].account_registerform_vallidation_modal_path
    if (page.has_css?(account_registerform_vallidation_modal_path))
      puts "There is a popup!"
    else
      expect(page).to have_no_css(checkout_registerform_skip_path)
        "expected not find '#{checkout_registerform_skip_path}' but it is here"
    end
  end

end

When(/^I set payment and shipping$/) do
  #css pathes
  checkout_step_payment_path = checkout[:pathes].checkout_step_payment_path
  checkout_delivery_options_path = checkout[:pathes].checkout_delivery_options_path
  checkout_paymentInAdvance_radio_path = checkout[:pathes].checkout_paymentInAdvance_radio_path
  checkout_payment_continue_path = checkout[:pathes].checkout_payment_continue_path
  checkout_payment_delivery_standard_radio_path = checkout[:pathes].checkout_payment_delivery_standard_radio_path
  checkout_orderbutton_path = checkout[:pathes].checkout_orderbutton_path
  checkout_step_confirm_path = checkout[:pathes].checkout_step_confirm_path

  account_registerform_vallidation_modal_path = checkout[:pathes].account_registerform_vallidation_modal_path
  account_registerform_vallidation_ignore_path = checkout[:pathes].account_registerform_vallidation_ignore_path

  if (ENV['COUNTRY'] == 'no') || (ENV['COUNTRY'] == 'se')
    if (page.has_css?(account_registerform_vallidation_modal_path))
      puts "found popup"
      find_secure(account_registerform_vallidation_ignore_path).click
      puts "--> closed popup"
    else
      puts "In #{ENV['COUNTRY']} is no popup"
    end
  end

  if (page.has_css?(checkout_step_payment_path))
    puts "I am here: #{current_url}"
    #step('I am looking for all different paymentmethods')
    #set payment
    step("I set payment")
    #set delivery
    step("I set shipping")
    #step("I am looking for all different paymentmethods")
    element = find_secure(checkout_payment_continue_path)
    element.click
    puts "--> click button to continue"
    expect(page).to have_no_css(checkout_step_payment_path)
     "expected not find '#{checkout_step_payment_path}' but it is here"
  elsif (page.has_css?(checkout_step_confirm_path))
    puts "I am already on the final checkoutpage"
  else
    puts "current_url:#{current_url}"
  end
end

When(/^I click the button to continue on the checkoutpage$/) do
  checkout_payment_confirm_button_path = ".confirm--actions > button"
  find_secure(checkout_payment_confirm_button_path, match: :first).click
  puts "> clicked button to confirm"
end

When(/^I click the button to go to the final page on mobile$/) do
  #css pathes
  checkout_payment_continue_path = checkout[:pathes].checkout_payment_continue_path

  find_secure(checkout_payment_continue_path)
  element = find_secure(checkout_payment_continue_path)
  element.click
  puts "--> click button to continue"
end

When(/^I am looking for all different paymentmethods$/) do
  account_accountinfo_payment_options_path = checkout[:pathes].account_accountinfo_payment_options_path
  account_accountinfo_payment_radio_path = checkout[:pathes].account_accountinfo_payment_radio_path
  account_accountinfo_payment_label_path = checkout[:pathes].account_accountinfo_payment_label_path
  # for a clean array
  VARS_ENV.paymentmethods = []
  payment_options = page.all(account_accountinfo_payment_options_path, visible: true)
  payment_options.each do |payment|
    payment.find(account_accountinfo_payment_radio_path)
    element = payment.find(account_accountinfo_payment_label_path)
    element_txt = element.text
    puts "> Payment: #{element_txt}"
    VARS_ENV.paymentmethods << element_txt
  end
  expect(VARS_ENV.paymentmethods.count).to eq(payment_options.count),
        "Expect to find the equal amount of paymentmethods as defined (in user.rb) but it isn't so"
  puts "> all paymentmethods are visible"
end

When(/^I set payment$/) do
  checkout_payment_form_path = checkout[:pathes].checkout_payment_form_path
  checkout_payment_options_path = checkout[:pathes].checkout_payment_options_path
  checkout_paymentInAdvance_radio_path = checkout[:pathes].checkout_paymentInAdvance_radio_path

  #expect(page).not_to have_css('.js--loading-indicator')

  find_secure(checkout_payment_form_path)
  #set payment
  if (page.has_css?(checkout_payment_options_path))
    element = find_secure(checkout_paymentInAdvance_radio_path)
    element.click
    puts "-> choose payment"
  else
    puts "----> there are no options to choose for payment"
  end
  sleep 2
  expect(page).not_to have_selector(".js--loading-indicator", visible: true)
  #expect(find_secure(:css, checkout_paymentInAdvance_radio_path)).to be_checked
  puts "> payment is chosen"
end

When(/^I set shipping$/) do
  checkout_delivery_options_path = checkout[:pathes].checkout_delivery_options_path
  checkout_payment_delivery_standard_radio_path = checkout[:pathes].checkout_payment_delivery_standard_radio_path
  #checkout_payment_form_path = checkout[:pathes].checkout_payment_form_path

  expect(page).not_to have_css('.js--loading-indicator')
  if (page.has_css?(checkout_delivery_options_path))
    find_secure(checkout_delivery_options_path)
    element = find_secure(checkout_payment_delivery_standard_radio_path, page.html)
    element.click
    puts "-> choose delivery"
  else
    puts "----> there are no options to choose for delivery"
  end
  expect(page).not_to have_selector(".js--loading-indicator", visible: true)
  puts "> shipping is chosen"
end

Then(/^Shopware should have my order$/) do
  if @made_order
    key = "email"
    eMail = account[:data].eMail
    url_part = 'finish'

    checkout_order_success_teaser = checkout[:pathes].checkout_order_success_teaser_path
    find_secure(checkout_order_success_teaser)
    puts "> found teaser for success"

    expect(current_url).to include(url_part),
      "Expected to be at #{url_part} but i am on #{current_url}"

    shopware.setDigest(ENV['SHOPWARE_USERNAME'], ENV['SHOPWARE_PASSWORD'], settings.urlHttps)
    puts ">> cancel orders of customer with #{key}:#{eMail}"
    shopware.updateOrderStatusForMail(eMail)
    #shopware.updateOrderStatusFor(key, eMail)
    next
  else
    puts "> Shopware can not have my order because i have not pressed the orderbutton"
  end
end
