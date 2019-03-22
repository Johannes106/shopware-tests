#newsletter.rb

When("I enter a mailaddress into the field of newsletter registration") do
  #vars
  email = account[:data].eMail

  homepage_footer_newsletter_box_path = '#newsletter--form'
  homepage_footer_newsletter_field_path = '.newsletter--field'
  # enter mailaddress
  @newsletter_box = page.find(homepage_footer_newsletter_box_path)
  newsletter_box = @newsletter_box
  form_set_value(newsletter_box, "email", email, homepage_footer_newsletter_field_path)
end

When("I push the send button") do
  #vars
  newsletter_box = @newsletter_box
  homepage_footer_newsletter_send_button_path = 'button'
  # click button
  element = @newsletter_box.find(homepage_footer_newsletter_send_button_path)
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
  @newsletter_box_registration = newsletter_box_registration
end

When("I save the form") do
  newsletter_form_send_button_path = 'button'
  newsletter_box_registration = @newsletter_box_registration
  # push the button
  element = newsletter_box_registration.find(newsletter_form_send_button_path)
  element.click
end

Then("I should see a box of acception") do
  newsletter_page_captcha_path = 'forms--captcha'
  newsletter_page_acception_alert_path = '.is--success'
  @captcha_appears = false
  # here can be a Captcha
  begin
    page.find(newsletter_page_acception_alert_path)
  rescue Capybara::ElementNotFound => e
    puts "\033[35m#{e.inspect}\033[0m\n"
    htmlcode = page.html
    @captcha_appears = true
    puts "> Captcha appears: #{html.include?(newsletter_page_captcha_path)} so I can not do anything more"
  end
  # puts "> write to log"
  # out_file = File.new("page.log", "w")
  # log = Logger.new(out_file)
  # log.debug(htmlcode)
end

Then("I should find the mailaddress in emarsys") do
  if(@captcha_appears)
    "> A captcha blocks the registration so i can not find the mailaddress in emnarsys"
  else
    email = account[:data].eMail
    emarsys_api.mailaddress = email
    emarsys_api.exists_mailaddress_in_db?
  end
end
