#navigation_menu
When(/^I navigate to an category by the hovermenu$/) do
  #var
  url_start = current_url
  category = article.category
  sub_category = article.sub_category
  
  #set pathes
  navigation_menu_path = csspathes.navigation_menu_path
  navigation_hovermenu_path = csspathes.navigation_hovermenu_path
  
  #main-topmenu
  navigationmenu = page.find(navigation_menu_path, match: :first)
  navigationmenu.hover
  puts "-> hovered menu"
  #hovermenu
  element = page.find(navigation_hovermenu_path, match: :first)
  element.click
  puts "-> clicked on hovermenu"
  #check for success
  expect(current_url).not_to eq(url_start),
     "Expect url of category but it was still #{current_url}"
end

When(/^I navigate to a subcategory by the menu$/) do
  #var
  url_start = current_url
  category = article.category
  
  #set pathes
  navigation_path = csspathes.navigation_path
  navigation_menu_path = csspathes.navigation_menu_path
  navigation_menu_title_path = csspathes.navigation_menu_title_path
  navigation_hover_breadcrumb_path = csspathes.navigation_hover_breadcrumb_path
  navigation_sidebar_sub_path = csspathes.navigation_sidebar_sub_path
  navigation_hovermenu_close_path = csspathes.navigation_hovermenu_close_path
  navigation_sidebar_path = csspathes.navigation_sidebar_path
  
  
  #main-menu
  page.find(navigation_path)
  element = page.find(navigation_menu_path)
  element.hover
  puts "hovered navi"
  #click headline of category
  element = page.find(navigation_menu_title_path)
  element.click
  puts "-> clicked category on menu"
  #sidebar-menu
  page.find(navigation_hover_breadcrumb_path)
  element = page.find(navigation_sidebar_sub_path)
  puts "> found sidebar"
  
  #check for success
  expect(current_url).not_to eq(url_start),
     "Expect url of category but it was still #{current_url}"
end

Then(/^I should be on a subcategorysite$/) do
  #1 - pathe
  navigation_sidebar_sub_path = csspathes.navigation_sidebar_sub_path
  
  #css-pathes
  navigation_hover_breadcrumb_path = csspathes.navigation_hover_breadcrumb_path
  
  #2 - looking for sidebar of categories
  page.find(navigation_hover_breadcrumb_path)
  breadcrumb = page.find(navigation_hover_breadcrumb_path)
  expect(page.has_css?(navigation_sidebar_sub_path))
      "expect to find a sidebar with subcategories but it isn't here"
end

