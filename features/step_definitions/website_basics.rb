#website_elements
Then(/^I should be a basic elements$/) do
  #define path of header
  homepage_content_header_path = csspathes.homepage_content_header_path
  homepage_content_searchfield_path = csspathes.homepage_content_searchfield_path
  homepage_content_navi_path = csspathes.homepage_content_navi_path
  homepage_content_body_main_path = csspathes.homepage_content_body_main_path
  homepage_content_footer_path = csspathes.homepage_content_footer_path

  #check for existing css-elements
  expect(page).to have_css(homepage_content_header_path),
      "Expect to find the css-element (#{homepage_content_header_path}) but the page with the url #{current_url} has no such element"
  puts "header exists"
  expect(page).to have_css(homepage_content_searchfield_path),
      "Expect to find the css-element (#{homepage_content_searchfield_path}) but the page with the url #{current_url} has no such element"
  puts "searchfield exists"  
  expect(page).to have_css(homepage_content_navi_path),
      "Expect to find the css-element (#{homepage_content_navi_path}) but the page with the url #{current_url} has no such element"
  puts "navi exists"
  expect(page).to have_css(homepage_content_body_main_path),
      "Expect to find the css-element (#{homepage_content_body_main_path}) but the page with the url #{current_url} has no such element"
  puts "inner body exists"
  expect(page).to have_css(homepage_content_footer_path),
      "Expect to find the css-element (#{homepage_content_footer_path}) but the page with the url #{current_url} has no such element"
  puts "footer exists"
end

When(/^I change the language by clicking the button$/) do
  #var
  language_change_to = user.language_change_to
  
  #pathes
  homepage_content_navi_language_path = '.top-bar > div > nav > div.top-bar--language.navigation--entry'
  homepage_content_navi_language_option_path = '.top-bar > div > nav > div.top-bar--language.navigation--entry > form > div > div.js--fancy-select.field--select'
  homepage_content_navi_language_options_selects_path = '.top-bar > div > nav > div.top-bar--language.navigation--entry > form > div > div.js--fancy-select.field--select > select > option'

  if language_change_to
    puts "> change language to #{language_change_to}"
    page.find(homepage_content_navi_language_path)
    element = page.find(homepage_content_navi_language_option_path)
    element.click
    #select language
    element = find(homepage_content_navi_language_options_selects_path, :text => language_change_to)
    element.click
    puts "> selected #{language_change_to}"
  else 
    puts "> in the shop of this country I can not change the language"
  end
end

Then(/^the url should has changed$/) do
  #var
  language_change_to = user.language_change_to
  country_contraction_language_change_to = user.country_contraction_language_change_to
  
  if language_change_to
    url = current_url
    puts "> current url: #{url}"
    expect(url).to include(country_contraction_language_change_to), 
       "expected new url includes '#{country_contraction_language_change_to}' but it is '#{current_url}'"
  end
end

Then(/^the menu is in specific language$/) do
  #var
  language_change_to = user.language_change_to
  category_language_changed = article.category_language_changed
  
  #pathes
  navigation_menu_path = csspathes.navigation_menu_path
  
  if language_change_to
    navigation = page.find(navigation_menu_path)
    navigation_txt = navigation.text
    expect(navigation_txt).to include(category_language_changed),
       "expected to find the category '#{category_language_changed}' but I only found #{navigation_txt}"
    puts "found category '#{category_language_changed}'"
  end
end

When(/^I check all links for correct country$/) do
  country_contraction = ENV['COUNTRY']
  #get links
  puts "digital publishing: "
  links_digital_publishing = page.all('.dig-pub > div > div > div > a', :visible => false).map { |a| a['href'] }
  look_for_string_in_array(links_digital_publishing, country_contraction)
  puts "product info links: "
  links_products = page.all('.product--info > a', :visible => false).map { |a| a['href'] }
  look_for_string_in_array(links_products, country_contraction)
end
