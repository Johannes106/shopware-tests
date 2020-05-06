#search
When(/^I am searching for a product by entering the sku in the searchfield$/) do
  page_content = page.html
  #variables:value
  sku = search[:data].sku
  printValue(:sku, binding)

  #variables:path
  search_searchfield_path = search[:pathes].search_searchfield_path
  search_searchbutton_path = search[:pathes].search_searchbutton_path
  #actions
  #find_secure(search_searchfield_path).set(sku)
  element = find_secure(search_searchfield_path, page_content)
  element.set(sku)
  search_searchbutton = find_secure(search_searchbutton_path, page_content)
  click_secure(search_searchbutton)
  puts "clicked button of search"
end

Then(/^I should be on the detailsite of the related product$/) do
  #variables:value
  name = search[:data].name
  search_product_name = name.upcase

  #variables:path
  search_product_name_path = search[:pathes].search_product_name_path

  #actions
  find_secure(search_product_name_path)
  element=find_secure(search_product_name_path)

  #convert string into downcase for comparing
  element_text = element.text
  element_text_up = element_text.upcase

  #expections
  expect(element_text_up).to include(search_product_name),
      "expected to find #{search_product_name} but just #{element_text_up} appears"
  puts "found '#{search_product_name}'"
end

When(/^I am searching for a product by entering the productnumber in the searchfield$/) do
  #variables:values
  productnumber = search[:data].productnumber
  printValue(:productnumber, binding)

  #variables:path
  search_searchfield_path = search[:pathes].search_searchfield_path
  search_searchbutton_path = search[:pathes].search_searchbutton_path
  #actions
  find_secure(search_searchfield_path).set(productnumber)
  search_searchbutton = find_secure(search_searchbutton_path)
  search_searchbutton.click()
  puts "clicked button of search"
end

Then(/^I should see my product on the results of my search$/) do
  #variables:value
  name = search[:data].name
  search_name = name.upcase

  #variables:path
  search_results_path = search[:pathes].search_results_path

  if ENV['SHOP'] == 'v_jobeline'
    if (page.has_no_css?(search_results_path))
      step('I should be on the detailsite of the related product')
    else
      #actions
      find_secure(search_results_path)
      element = find_secure(search_results_path)
      element_text = element.text.upcase

      #expections
      expect(element_text).to include(search_name),
          "expected to find #{name} in my results but just #{element_text} appears"
      puts "found '#{name}'"
    end
  else
    #actions
    find_secure(search_results_path)
    element = find_secure(search_results_path)
    element_text = element.text.upcase

    #expections
    expect(element_text).to include(search_name),
        "expected to find #{name} in my results but just #{element_text} appears"
    puts "found '#{name}'"
  end
end

When(/^I am searching for products by entering the productname in the searchfield$/) do
  name = search[:data].name
  printValue(:name, binding)

  #variables:path
  search_searchfield_path = search[:pathes].search_searchfield_path
  search_searchbutton_path = search[:pathes].search_searchbutton_path
  #actions
  find_secure(search_searchfield_path).set(name)
  search_searchbutton = find_secure(search_searchbutton_path)
  search_searchbutton.click()
  puts "clicked button of search"
end


When(/^I touch the button of searching$/) do
  search_searchbutton_mobile_path = search[:pathes].search_searchbutton_mobile_path

  find_secure(search_searchbutton_mobile_path)
  element = find_secure(search_searchbutton_mobile_path)
  element.click
end
