#website_basics
class Csspathes_Websitebasics
  attr_accessor :homepage_content_logo_path, :homepage_product_cart_hint_content_path, :account_accountpage_welcome_path,
                #homepage
                :homepage_content_header_path, :homepage_content_searchfield_path, :homepage_content_navi_path, :homepage_content_navi_burger_path, :homepage_content_navi_burger_category_path,
                :homepage_content_navi_burger_category_title_path, :homepage_content_body_main_path, :homepage_content_footer_path,
                #navigation
                :navigation_menu_path, :navigation_hovermenu_path, :navigation_menu_title_path, :navigation_path, :navigation_hovermenu_close_path, :navigation_sidebar_sub_path,
                :navigation_sidebar_path, :navigation_hover_breadcrumb_path,
                #links
                :links_account_path, :links_account_icon_path, :links_registration_path, :links_accordion_path, :links_notes_path, :links_note_path, :links_cart_symbol_path,
                :links_cart_sidebar_path, :links_cart_button_path, :links_service_path, :links_context_path, :links_about_path, :links_imprint_path, :links_info_headline

  def initialize
    @homepage_content_logo_path = '.logo-main'
    @homepage_product_cart_hint_content_path = "div > div > div > div > .alert--content"
    @account_accountpage_welcome_path = '.account--welcome.panel'
    #website basics
    @homepage_content_header_path = 'div.page-wrap > header'
    @homepage_content_searchfield_path = '.navigation--entry.entry--search'
    @homepage_content_logo_path = '.logo-main'
    @homepage_content_navi_path = '.navigation-main'
    @homepage_content_navi_burger_path = '.entry--menu-left.entry--menu > a > i'
    @homepage_content_navi_burger_category_path = 'body > div.page-wrap > section > div > aside > div.sidebar--categories-wrapper > div.sidebar--categories-navigation > ul > li:nth-child(1) > a'
    @homepage_content_navi_burger_category_title_path = '.background > ul > li:nth-child(2) > a'
    @homepage_content_body_main_path = '.content-main'
    @homepage_content_footer_path = 'footer'
    #navigation
    @navigation_menu_path = '.navigation--list-wrapper > ul > li:first-child > a'#'.navigation-main'
    @navigation_menu_title_path = '.advanced-menu > div.menu--container.menu--is-active > div.button-container > a'
    @navigation_hovermenu_path = '.menu--is-active > .content--wrapper > .menu--container-flyout > ul > li:first-child'#'.advanced-menu > div.menu--container.menu--is-active > div.content--wrapper.has--content.has--teaser > div.menu--container-flyout > ul > li:first-child'
    @navigation_path = '.navigation-main'
    @navigation_hovermenu_close_path = 'form > label'
    @navigation_sidebar_sub_path = '.navigation--entry.is--active.has--sub-categories.has--sub-children > ul > li:first-child > a '#
    @navigation_sidebar_path = '.sidebar--categories-navigation'
    @navigation_hover_breadcrumb_path = '.content--breadcrumb'
    #links
    @links_account_path = '.entry--account'
    @links_account_icon_path = '.entry--account > a > i'
    @links_registration_path = '#registration'
    @links_accordion_path = 'body > div.page-wrap > section > div > div > div.accordion-container > div.css-accordion-head.btn > label >.css-accordion-head-content'
    @links_notes_path = '.entry--wishlist > a'
    @links_note_path = '.note--content'
    @links_cart_symbol_path = '.entry--cart'
    @links_cart_button_path = '.button--open-basket'
    @links_cart_sidebar_path = '.container--ajax-cart'
    @links_service_path = ':nth-child(3) > nav > ul > li:nth-child(1) > a'
    @links_context_path = '.navigation--entry.is--active.has--sub-categories'
    @links_about_path = 'footer > div:nth-child(3) > div > div:nth-child(3) > div'
    @links_imprint_path = ':nth-child(3) > nav > ul > li:nth-child(5) > a'
    @links_info_headline ='.emotion--row > div > h1'
    update_pathes
  end

  def update_pathes
    #give vars of enviroment to local vars
    @env_country ||= VARS_ENV.r_country
    @env_system ||= VARS_ENV.r_system
    @env_shop ||= VARS_ENV.r_shop
    # define hash of countries
    @homepage_content_header_path = 'body > div.page-wrap > header' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @homepage_content_navi_path = 'body > div.page-wrap > nav' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @homepage_content_body_main_path = 'div.page-wrap > section > div' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @@homepage_content_navi_burger_path = 'div.product--buybox.block > div > form > div > button' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_menu_path = '.page-wrap > nav' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_menu_title_path = '.page-wrap > nav' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_menu_title_path = '.navigation--list-wrapper > ul > li:first-child > a' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_hovermenu_path = '.menu--container.menu--is-active > div.content--wrapper.has--content > div > ul > li:nth-child(1) > a' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/it/)
    @navigation_hovermenu_path = '.menu--list-item' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/se/)
    @navigation_hovermenu_path = '.menu--list-item' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/no/)
    @navigation_hovermenu_path = '.menu--list-item' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/nl/)
    @navigation_hovermenu_path = '.menu--list-item' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/es/)
    @navigation_hovermenu_path = '.advanced-menu' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_hovermenu_path = '.advanced-menu' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_path = '.page-wrap > nav' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_hovermenu_close_path = '.menu--is-active > div.button-container > span > i' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_sidebar_sub_path = '.has--sub-categories > ul > li:nth-child(1)' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/it/)
    @navigation_sidebar_sub_path = '.sidebar--categories-wrapper > div.sidebar--categories-navigation > ul > li.navigation--entry.is--active.has--sub-categories' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_sidebar_sub_path = '.sidebar--categories-wrapper > div.sidebar--categories-navigation > ul > li.navigation--entry.is--active.has--sub-categories' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @navigation_sidebar_sub_path = '.sidebar--categories-wrapper > div.sidebar--categories-navigation > ul > li.navigation--entry.is--active.has--sub-categories' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/nl/)
    @navigation_hover_breadcrumb_path = 'section > nav > ul' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @links_account_icon_path = 'div.product--buybox.block > div > form > div > button' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @links_notes_path = '.entry--notepad' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @links_cart_sidebar_path = '.container--ajax-cart.off-canvas.is--right.is--active.is--open' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @links_service_path = 'div.navigation--entry.entry--service' if "#{@env_shop}".match(/(pulsiva|chefworks)/) && "#{@env_country}".match(/[a-z]{2}/)
    @links_context_path = '.navigation--entry.entry--service.has--drop-down.js--is--dropdown-active > ul' if "#{@env_shop}".match(/(pulsiva|chefworks)/) && "#{@env_country}".match(/[a-z]{2}/)
    @links_context_path = '.navigation--entry.entry--service.has--drop-down' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/)
    @links_context_path = '.navigation--entry.entry--service.has--drop-down' if "#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/)
  end

end
