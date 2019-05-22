#website_elements
When("I am looking for the current url") do
  website_url = settings.urlHttps
  VARS_ENV.url_base = current_url
end

Then("the defined url and the current_url should be equal") do
  website_url = settings.urlHttps
  url = VARS_ENV.url_base
  compare_urls(website_url, url)
end

Then("css elements should be modified by stylesheet") do
  node_element = page.find(".page-wrap") #=node element
  webdriver_element = node_element.native#=selenium webdriver element
  #get style of webdriver element
  margin_right = webdriver_element.style('margin-right')
  puts ("> margin_right:#{margin_right}")
  expect(margin_right).to eq(('0px')),
     ".page-wrap: Expect to get margin of 0px, but i get #{margin_right}"
  #puts "Style: #{webdriver_element.style('margin-right')}"
  #puts "Style: #{node_element.native.style('margin-left')}"
  #puts "Style: #{node_element.native.style('margin-top')}"
  #puts "Style: #{node_element.native.style('margin-bottom')}"
end

Then(/^I should see all basic elements$/) do
  #define path of header
  homepage_content_header_path = websitebasics[:pathes].homepage_content_header_path
  homepage_content_searchfield_path = websitebasics[:pathes].homepage_content_searchfield_path
  homepage_content_navi_path = websitebasics[:pathes].homepage_content_navi_path
  homepage_content_body_main_path = websitebasics[:pathes].homepage_content_body_main_path
  homepage_content_footer_path = websitebasics[:pathes].homepage_content_footer_path

  find_secure(homepage_content_searchfield_path)
  #check for existing css-elements
  find_secure(homepage_content_header_path)
  expect(page).to have_css(homepage_content_header_path),
      "Expect to find the css-element (#{homepage_content_header_path}) but the page with the url #{current_url} has no such element"
  puts "header exists"
  expect(page).to have_css(homepage_content_searchfield_path),
      "Expect to find the css-element (#{homepage_content_searchfield_path}) but the page with the url #{current_url} has no such element"
  puts "searchfield exists"
  find_secure(homepage_content_navi_path)
  expect(page).to have_css(homepage_content_navi_path),
      "Expect to find the css-element (#{homepage_content_navi_path}) but the page with the url #{current_url} has no such element"
  puts "navi exists"
  find_secure(homepage_content_body_main_path)
  expect(page).to have_css(homepage_content_body_main_path),
      "Expect to find the css-element (#{homepage_content_body_main_path}) but the page with the url #{current_url} has no such element"
  puts "inner body exists"
  find_secure(homepage_content_footer_path)
  expect(page).to have_css(homepage_content_footer_path),
      "Expect to find the css-element (#{homepage_content_footer_path}) but the page with the url #{current_url} has no such element"
  puts "footer exists"
end

Then(/^I should see all basic mobile elements$/) do
  #define path of header
  homepage_content_header_path = websitebasics[:pathes].homepage_content_header_path
  homepage_content_searchfield_path = websitebasics[:pathes].homepage_content_searchfield_path
  homepage_content_navi_burger_path = websitebasics[:pathes].homepage_content_navi_burger_path
  homepage_content_body_main_path = websitebasics[:pathes].homepage_content_body_main_path
  homepage_content_footer_path = websitebasics[:pathes].homepage_content_footer_path

  find_secure(homepage_content_searchfield_path)
  #check for existing css-elements
  find_secure(homepage_content_header_path)
  expect(page).to have_css(homepage_content_header_path),
      "Expect to find the css-element (#{homepage_content_header_path}) but the page with the url #{current_url} has no such element"
  puts "header exists"
  expect(page).to have_css(homepage_content_searchfield_path),
      "Expect to find the css-element (#{homepage_content_searchfield_path}) but the page with the url #{current_url} has no such element"
  puts "searchfield exists"
  find_secure(homepage_content_navi_burger_path)
  expect(page).to have_css(homepage_content_navi_burger_path),
      "Expect to find the css-element (#{homepage_content_navi_burger_path}) but the page with the url #{current_url} has no such element"
  puts "navi exists"
  find_secure(homepage_content_body_main_path)
  expect(page).to have_css(homepage_content_body_main_path),
      "Expect to find the css-element (#{homepage_content_body_main_path}) but the page with the url #{current_url} has no such element"
  puts "inner body exists"
  find_secure(homepage_content_footer_path)
  expect(page).to have_css(homepage_content_footer_path),
      "Expect to find the css-element (#{homepage_content_footer_path}) but the page with the url #{current_url} has no such element"
  puts "footer exists"
end


When(/^I change the language by clicking the button$/) do
  #var
  language_change_to = user.language_change_to
  #pathes
  homepage_content_navi_language_trigger_path = '.top-bar--language.navigation--entry > form > div'
  homepage_content_navi_language_option_path = '.html-option'

  if language_change_to
    find_secure(homepage_content_navi_language_trigger_path)
    element = find_secure(homepage_content_navi_language_trigger_path)
    element.click
    element = find(homepage_content_navi_language_option_path, :text => language_change_to)
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
  category_language_changed = websitebasics[:data].category_language_changed

  #pathes
  navigation_menu_path = websitebasics[:pathes].navigation_menu_path

  if language_change_to
    navigation = find_secure(navigation_menu_path)
    navigation_txt = navigation.text
    expect(navigation_txt).to include(category_language_changed),
       "expected to find the category '#{category_language_changed}' but I only found #{navigation_txt}"
    puts "found category '#{category_language_changed}'"
  end
end

When(/^I check all links for correct country$/) do
  country_contraction = ENV['COUNTRY']
  #get links
  if ENV['SYSTEM'] == 'live'
    puts "digital publishing: "
    links_digital_publishing = page.all('.dig-pub > div > div > div > a', :visible => true).map { |a| a['href'] }
    look_for_string_in_array(links_digital_publishing, country_contraction)
    puts "product info Links: "
    links_products = page.all('.product--info > a', :visible => false).map { |a| a['href'] }
    look_for_string_in_array(links_products, country_contraction)
  else
    puts "I am on the #{ENV['SYSTEM']} and there the links are not uptodate"
  end
end

When(/^I check all hreflang for correct url$/) do
  # get header of page
  header = page.find('head', :visible => false)
  header.all('link', :visible => false).map { |a| a['rel'] }

  url_canonical = get_canonical(header)
  url_alternate = get_alternate(header)

  # only get main url without shortcuts of countries
  shop_url = get_mainpart_of_url(url_canonical)
  !shop_url.to_s
  # check alternates including canonical
  puts "Compare: #{url_alternate} <-> #{shop_url}}"
  look_for_string_in_array(url_alternate, shop_url.to_s)
end
