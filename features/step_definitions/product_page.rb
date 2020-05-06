#product_page
Given(/^I am on the product page of an article$/) do
  if (VARS_ENV.url_productpage)
    website_url = VARS_ENV.url_productpage
    #actions
    visit_secure(website_url)
  else
    step("I am on the website")
    step("I am searching for a product by entering the sku in the searchfield")#"I am searching for an product by entering the sku in the searchfield")
    step("I should be on the detailsite of the related product")
    step("set the url of the product page")
  end
end
  #VARS_ENV.url_productpage = current_url
  #puts VARS_ENV.url_pro
Then(/^set the url of the product page$/) do
  if current_url
    if VARS_ENV.url_productpage
      VARS_ENV.url_productpage = current_url
      puts VARS_ENV.url_productpage
    else
      puts "Url of productpage is already set"
    end
  end
end

When(/^I add an article to the product cart by clicking the button to push it into the cart$/) do
  #var
  product_page_buybutton_path = productpage[:pathes].product_page_buybutton_path

  find_secure(product_page_buybutton_path)
  element = find_secure(product_page_buybutton_path)
  click_secure(element)
  puts "-> clicked buy button"
end

Then(/^I should see the cart on the right of the site$/) do
  product_page_infobox_path = productpage[:pathes].product_page_infobox_path

  find_secure(product_page_infobox_path)
end

Then(/^I should see this article in the product cart$/) do
  #define sku for product
  #define path for product
  #visit url for cart
  #find block of productinfo
  #find text of sku in text of productinfo
  #expect
  sku = productpage[:data].sku
  url_website = settings.urlHttps
  url_productcart = 'checkout/cart'
  url_cart = url_website+url_productcart
  product_cart_productinfo_path = productpage[:pathes].product_cart_productinfo_path

  visit(url_cart)
  find_secure(product_cart_productinfo_path)
  element = find_secure(product_cart_productinfo_path)
  productinfo_txt = element.text

  #check for success
  expect(current_url).to eq(url_cart),
     "Expect url of the cart (#{url_cart}) but it was still #{current_url}"
  expect(productinfo_txt).to include(sku),
     "Expect to find the sku (#{sku}) in the block of the productinfo_txt but only found (#{productinfo_txt})"

end

Then(/^I should see an article in the product cart$/) do
  #define sku for product
  #define path for product
  #visit url for cart
  #find block of productinfo
  #find text of sku in text of productinfo
  #expect
  url_website = settings.urlHttps
  url_productcart = 'checkout/cart'
  url_cart = url_website+url_productcart
  product_cart_productinfo_path = productpage[:pathes].product_cart_productinfo_path

  visit(url_cart)
  find_secure(product_cart_productinfo_path, match: :first)

  #check for success
  expect(current_url).to eq(url_cart),
     "Expect url of the cart (#{url_cart}) but it was still #{current_url}"

end

Then(/^I should see all necessary elememts for getting more informations about this article$/) do
  # define name
  name = productpage[:data].name
  name = name.upcase

  # define path of name
  product_page_productname_path = productpage[:pathes].product_page_productname_path
  # define path of product_picture
  product_page_productpicture_path = productpage[:pathes].product_page_productpicture_path
  # define path of product_configuration
  product_page_productconfig_path = productpage[:pathes].product_page_productconfig_path
  # define path of product_information
  product_page_productinfo_path = productpage[:pathes].product_page_productinfo_path
  # define path of product_recommodations
  #product_page_productrecommodations_path = productpage[:pathes].product_page_productrecommodations_path
  # define path of last seen products
  #product_page_productlast_path = productpage[:pathes].product_page_productlast_path

  # expect name_path include name
  productname_element = find_secure(product_page_productname_path)
  productname_txt = productname_element.text
  productname_txt_up = productname_txt.upcase
  expect(productname_txt_up).to include(name),
      "Expect to find the name (#{name}) on the productsite but only found (#{productname_txt})"
  # expect page has css for productpicture
  expect(page).to have_css(product_page_productpicture_path),
      "Expect to find the css-element (#{product_page_productpicture_path}) but the page with the url #{current_url} has no such element"
  # expect page has css of productconfiguration
  expect(page).to have_css(product_page_productconfig_path),
      "Expect to find the css-element (#{product_page_productconfig_path}) but the page with the url #{current_url} has no such element"
  # expect page has css of productinformation
  expect(page).to have_css(product_page_productinfo_path),
      "Expect to find the css-element (#{product_page_productinfo_path}) but the page with the url #{current_url} has no such element"
  # expect page has css of productrecommodations
  #expect(page).to have_css(product_page_productrecommodations_path),
  #    "Expect to find the css-element (#{product_page_productrecommodations_path}) but the page with the url #{current_url} has no such element"
  # expect page has css of product_configuration
  #expect(page).to have_css(product_page_productlast_path),
  #    "Expect to find the css-element (#{product_page_productlast_path}) but the page with the url #{current_url} has no such element"
end

When(/^I press the remember\-button$/) do
  #define path of button
  product_page_rememberbutton_path = productpage[:pathes].product_page_rememberbutton_path #pulsiva: .cart--add-to-list
  #find button
  element = find_secure(product_page_rememberbutton_path)
  #click button
  element.click
end

Then(/^there should see a hint$/) do
  #define path of symbol
  product_page_heart_badge_path = productpage[:pathes].product_page_heart_badge_path
  #expect csspath of symbol
  expect(page).to have_css(product_page_heart_badge_path),
      "Expect to find the css-element (#{product_page_heart_badge_path}) but the page with the url #{current_url} has no such element"
end

When(/^I press the compare\-button$/) do
  #define path of button
  product_page_comparebutton_path = productpage[:pathes].product_page_comparebutton_path
  #find button
  element = find_secure(product_page_comparebutton_path)
  #click button
  element.click
end

Then(/^there should see the icon to compare$/) do
  #define path of symbol
  product_page_compareicon_path = productpage[:pathes].product_page_compareicon_path
  #expect csspath of symbol
  expect(page).to have_css(product_page_compareicon_path),
      "Expect to find the css-element (#{product_page_compareicon_path}) but the page with the url #{current_url} has no such element"
end

When(/^I click the button to rate for the article$/) do
  if (ENV['SHOP'] == 'chefworks')
    #define path of symbol
    product_page_rate_ratebutton_path = productpage[:pathes].product_page_rate_ratebutton_path
    #expect csspath of symbol
    element = find_secure(product_page_rate_ratebutton_path)
    element.click
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

When(/^I change in the tab to the rating$/) do
  if (ENV['SHOP'] == 'chefworks')
    #define path of tab
    product_page_rate_tab_menu = productpage[:pathes].product_page_rate_tab_menu
    product_page_rate_tab_rateflag = productpage[:pathes].product_page_rate_tab_rateflag
    #click tab for rate
    element = find_secure(product_page_rate_tab_menu+product_page_rate_tab_rateflag)
    element.click
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

Then(/^there should be a form for rating the article$/) do
  if (ENV['SHOP'] == 'chefworks')
    #define path of form
    product_page_rate_form = productpage[:pathes].product_page_rate_form
    #find path
    find_secure(product_page_rate_form)
    puts "found form to rate"
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

When(/^I change to the tab of the customer viewed articles$/) do
  if (ENV['SHOP'] == 'chefworks')
    #define path
    product_page_viewed_tab_menu = productpage[:pathes].product_page_viewed_tab_menu
    product_page_viewed_tab_otherCustomer = productpage[:pathes].product_page_viewed_tab_otherCustomer
    #click tab for rate
    element = find_secure(product_page_viewed_tab_menu+product_page_viewed_tab_otherCustomer)
    element.click
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

Then(/^there should be a box of some articles$/) do
  if (ENV['SHOP'] == 'chefworks')
    product_page_suggest_container = productpage[:pathes].product_page_suggest_container
    #find path
    find_secure(product_page_suggest_container)
    puts "found container list"
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end
