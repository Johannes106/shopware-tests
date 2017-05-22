#product_cart
Given(/^I am on the product cart page$/) do
  website_url = settings.urlHttps
  url_part_product_cart = 'checkout/cart'
  url = "#{website_url}#{url_part_product_cart}"
  
  visit(url)
  puts "-> go to #{url}"
  expect(current_url).to include(url_part_product_cart),
    "Expected url contains #{url_part_product_cart} but i am on #{current_url}"
end

Given(/^the product cart contains an article$/) do
  puts "I am on the product cart page"
  step("I am on the product cart page")
  
  # with ajax'
  product_cart_article_path = csspathes.product_cart_article_path
  page.find(product_cart_article_path)
  
  #check if cart contains an article
  expect(page).to have_css(product_cart_article_path),
    "Expected find an article in my cart but there is no csspath of #{product_cart_article_path}"
end


And(/^I add an article to my cart manually$/) do
  puts "I am on the product page of an article"
  step("I am on the product page of an article")
  block_css('.navigation-main')  
  puts "I add an article to the product cart by clicking the button to push it into the cart"
  step("I add an article to the product cart by clicking the button to push it into the cart")
  puts "I am on the product cart page"
  step("I am on the product cart page")
end

And(/^I add an article to my cart by ajax$/) do
  website_url = settings.urlHttps
  sku = article.sku
  amount = article.amount
  #assembling url:
  ajax_params_function = "checkout/ajaxAddArticleCart?callback=jQuery"
  ajax_params_sku = "&sAdd=#{sku}"
  ajax_params_amount = "&sQuantity=#{amount}"
  ajax_url = "#{website_url}#{ajax_params_function}#{ajax_params_sku}#{ajax_params_amount}"
  puts "-> add article: #{ajax_url}"
  visit(ajax_url)
end

When(/^I click on the button to continue shopping$/) do
  start_url = current_url
  product_cart_button_continue_path = csspathes.product_cart_button_continue_path
  
  element = page.find(product_cart_button_continue_path, match: :first)
  element.click
  puts "--> clicked button for continue"
  #check for success
  check_for_url_change(start_url)
end

Then(/^I will see the back on the productsite$/) do
  step("I should be on the detailsite of the related product")
end

When(/^I remove this article from the product cart$/) do
  product_cart_remove_article_path = csspathes.product_cart_remove_article_path
  
  page.find(product_cart_remove_article_path)
  element = page.find(product_cart_remove_article_path)
  element.click
  puts "clicked icon"
end

Then(/^the cart should not contain this article$/) do
  product_cart_article_path = csspathes.product_cart_article_path
  
  expect(page).to have_no_css(product_cart_article_path)
     "expected not to find css (#{product_cart_article_path}), but it is still not available"
end

Then(/^I should see all necessary informations about this article within the product list of the product cart$/) do
  product_cart_article_details_path = csspathes.product_cart_article_details_path
  product_cart_article_price_path = csspathes.product_cart_article_price_path
  product_cart_article_voucher_path = csspathes.product_cart_article_voucher_path
  
  expect(page).to have_css(product_cart_article_details_path),
     "expected to see here details to the article in my cart in the css (#{product_cart_article_details_path}), but it does not appear!"
  puts "found product details"
  expect(page).to have_css(product_cart_article_price_path),
     "expected to see here about each costt of the price for the article on my cart in the css (#{product_cart_article_price_path}), but it does not appear!"
  puts "found product prices"
  expect(page).to have_css(product_cart_article_voucher_path),
     "expected to have here the possibility to enter my code into a field on my cart in the css (#{product_cart_article_voucher_path}), but it does not appear!"
  puts "found field for voucher"
end

When(/^I navigate to the checkout by clicking the button which navigates to the checkout$/) do
  start_url = current_url
  product_cart_button_checkout_path = csspathes.product_cart_button_checkout_path#there are 2 buttons
  
  #check for first button
  element = page.find(product_cart_button_checkout_path, match: :first)
  element.click
  puts "clicked button"
  #check for success
  check_for_url_change(start_url)
end

Then(/^I should be on the checkout\-page$/) do
  url_checkout_confirm = 'checkout'
  product_cart_checkout_steps_path = csspathes.product_cart_checkout_steps_path
  
  expect(page).to have_css(product_cart_checkout_steps_path),
     "expected to find here the icons of each step for checkout (#{product_cart_checkout_steps_path}), but they do not appear!"
  expect(current_url).to include(url_checkout_confirm),
     "expected that the current_url contains #{url_checkout_confirm} but it is only #{current_url}"
end

When(/^I activate the function for voucher$/) do
  if (ENV['SHOP'] == 'chefworks')
    product_cart_voucher_checkbox_path = csspathes.product_cart_voucher_checkbox_path
    
    page.find(product_cart_voucher_checkbox_path)
    element = page.find(product_cart_voucher_checkbox_path)
    element.click
    puts "clicked checkbox"
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

When(/^I enter some code into the optional field$/) do
  if (ENV['SHOP'] == 'chefworks')
    code_voucher = '266233'
    product_cart_voucher_input_path = csspathes.product_cart_voucher_input_path
    product_cart_voucher_button_path = csspathes.product_cart_voucher_button_path
    
    element = page.find(product_cart_voucher_input_path)
    element.set(code_voucher)
    puts "entered #{code_voucher}"
    element = page.find(product_cart_voucher_button_path)
    element.click
    puts "clicked add-button"
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

Then(/^there should be the voucher-action in the url$/) do
  if (ENV['SHOP'] == 'chefworks')
    url_voucher = 'addVoucher/sTargetAction'
    
    expect(current_url).to include(url_voucher),
       "expected that the current url (current_url includes #{url_voucher}, but it isn't so"
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

When(/^I enter a sku into the integrated field on the cart$/) do
  if (ENV['SHOP'] == 'chefworks')
    sku = article.sku
    product_cart_order_sku_path = csspathes.product_cart_order_sku_path
    product_cart_order_button_path = csspathes.product_cart_order_button_path
    
    page.find(product_cart_order_sku_path)
    element = page.find(product_cart_order_sku_path)
    element.set(sku)
    element = page.find(product_cart_order_button_path)
    element.click
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end

Then(/^I will see the add-action in the url$/) do
  if (ENV['SHOP'] == 'chefworks')
    url_add_comand = settings.url_add_comand
    
    expect(current_url).to include(url_add_comand),
       "expected that the current_url contains #{url_add_comand} but it is only #{current_url}"
  else
    puts "On the shop of #{ENV['SHOP']} this feaature does not exist"
  end
end