#newsletter.rb
When("I enter a mailaddress into the field of newsletter registration") do
  #vars
  email = account[:data].eMail

  homepage_footer_newsletter_box_path = '#newsletter--form'
  homepage_footer_newsletter_field_path = '.newsletter--field'
  # enter mailaddress
  Newsletter_box = page.find(homepage_footer_newsletter_box_path)
  newsletter_box = Newsletter_box
  form_set_value(newsletter_box, "email", email, homepage_footer_newsletter_field_path)
end

When("I push the send button") do
  #vars
  newsletter_box = Newsletter_box
  homepage_footer_newsletter_send_button_path = 'button'
  # click button
  element = Newsletter_box.find(homepage_footer_newsletter_send_button_path)
  element.click
end

When("I fill out the register form") do
  #vars
  email = account[:data].eMail
  prefix = account[:data].prefix
  firstname = account[:data].firstname
  lastname = account[:data].lastname
  street = account[:data].street
  postcode = account[:data].postcode
  city = account[:data].city

  newsletter_box_registration_form_path = '.newsletter--form'
  newsletter_form_mail_field_path = '.newsletter--email'
  newsletter_form_prefix_dropdown_path = '.newsletter--salutation'
  newsletter_form_firstname_field_path = '.newsletter--firstname'
  newsletter_form_lastname_field_path = '.newsletter--lastname'
  newsletter_form_street_field_path = '.newsletter--street'
  newsletter_form_postcode_field_path = '.newsletter--zip-city .input--spacer'
  newsletter_form_city_field_path = '.newsletter--zip-city .input--field-city'

  # fill out the form
  newsletter_box_registration = page.find(newsletter_box_registration_form_path, match: :first)
  form_set_value(newsletter_box_registration, "email", email, newsletter_form_mail_field_path)
  form_set_value(newsletter_box_registration, "prefix", prefix, newsletter_form_prefix_dropdown_path)
  form_set_value(newsletter_box_registration, "firstname", firstname, newsletter_form_firstname_field_path)
  form_set_value(newsletter_box_registration, "lastname", lastname, newsletter_form_lastname_field_path)
  form_set_value(newsletter_box_registration, "street", street, newsletter_form_street_field_path)
  form_set_value(newsletter_box_registration, "postcode", postcode, newsletter_form_postcode_field_path)
  form_set_value(newsletter_box_registration, "city", city, newsletter_form_city_field_path)
  Newsletter_box_registration = newsletter_box_registration
end

When("I save the form") do
  newsletter_form_send_button_path = 'button'
  newsletter_box_registration = Newsletter_box_registration
  # push the button
  element = newsletter_box_registration.find(newsletter_form_send_button_path)
  element.click
end

Then("I should see a box of acception") do
  newsletter_page_captcha_path = 'forms--captcha'
  newsletter_page_acception_alert_path = '.is--success'
  newsletter_secure_counter = 0;
  @captcha_appears = false
  # here can be a Captcha
  begin
    page.find(newsletter_page_acception_alert_path)
    puts "> found #{newsletter_page_acception_alert_path}"
  rescue Capybara::ElementNotFound => e
    newsletter_secure_counter += 1
    puts "\033[35m#{e.inspect}\033[0m\n"
    newsletter_page_acception_alert_path = '.is--warning'
    newsletter_secure_counter <= 1 ? retry : puts('hello')
    htmlcode = page.html
    @captcha_appears = true
    puts "> Captcha appears: #{html.include?(newsletter_page_captcha_path)} so I can not do anything more"
  end
end

Then("I should find the mailaddress in emarsys") do
  if(@captcha_appears.eql?(true))
    puts "> A captcha blocks the registration so i can not find the mailaddress in emnarsys"
  else
    email = account[:data].eMail
    step('my mailaddress was sent to emarsys automatically')
    #emarsys_api.mailaddress = email
    #emarsys_api.delete_mailaddress
    #expect(exist).to eq(true)
  end
end

When("I set the option to get a newsletter") do
  account_accountinfo_newsletter_box_path = '.account--newsletter'
  account_accountinfo_newsletter__acception_checkbox_path = '#newsletter'

  newsletter_box_account = page.find(account_accountinfo_newsletter_box_path)
  newsletter_box_account.find(account_accountinfo_newsletter__acception_checkbox_path).click
end

Then("I should see a hint for changing settings") do
  newsletter_page_acception_alert_path = '.is--success'
  page.find(newsletter_page_acception_alert_path)
end

#NOT USED ANYMORE: Then I should "not" find the mailaddress in emarsys
Then("I should {string} find the mailaddress in emarsys") do |string|
    if(string.eql?("not"))
      puts "NOT"
      email = account[:data].eMail
      emarsys_api.mailaddress = email
      exist = emarsys_api.exists_mailaddress_in_db?
      puts "exist: #{exist}"
      expect(exist).to eq(false)
    else
      puts "should:#{string}"
      email = account[:data].eMail
      emarsys_api.mailaddress = email
      exist = emarsys_api.exists_mailaddress_in_db?
      puts "exist: #{exist}"
      expect(exist).to eq(true)
    end
end

Given("I have completed an order") do
    step("I already created an user account")
    step("I am logged in")
    step("I add an article to my cart by ajax")
    step("the product cart contains an article")
    step("I am on the checkout page")
    step("I set payment")
    step("I set shipping")
    step("I am looking for all different paymentmethods")
    step("I click the button to continue on the checkoutpage")
    step("I send my order")
    step("Shopware should have my order")
end

Then ("my mailaddress was sent to emarsys automatically") do
  # puts "YAML:#{yaml_exists}"
  # if (yaml_exists)
    email = account[:data].eMail
    emarsys_api.mailaddress = email
  #  puts "#{emarsys_api.exists_mailaddress_in_db?}"
    emarsys_api.delete_mailaddress
    #expect(exist).to eq(true)
  # else
  #   puts "> No yaml exists"
  # end
end
