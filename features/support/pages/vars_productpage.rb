#product_page
class Csspathes_Productpage
  attr_accessor :homepage_content_logo_path,
                :product_page_buybutton_path, :product_page_infobox_path, :product_cart_productinfo_path, :product_page_productname_path, :product_page_productpicture_path, :product_page_productconfig_path, :product_page_productinfo_path, :product_page_productrecommodations_path, :product_page_productlast_path, :product_page_rememberbutton_path, :product_page_heart_badge_path, :product_page_comparebutton_path, :product_page_compareicon_path, :product_page_rate_ratebutton_path, :product_page_rate_tab_menu, :product_page_rate_tab_rateflag, :product_page_viewed_tab_menu, :product_page_viewed_tab_otherCustomer, :product_page_rate_form, :product_page_suggest_container
  def initialize
    @homepage_content_logo_path = '.logo-main'
    @product_page_buybutton_path = '.MainProductButtons > div'#'form > div > button' #pdp:
    @product_page_infobox_path = '.is--active.is--open'
    @product_cart_productinfo_path = 'div.panel--td.table--content'
    @product_page_productname_path = '.MainProductName'#'header > div > h1' #pdp:
    @product_page_productpicture_path = '.image-gallery'#'.image-slider--container' #pdp: .image-gallery
    @product_page_productconfig_path = '.ProductSelectionBox'#'div.product--buybox.block' #pdp: .ProductSelectionBox
    @product_page_productinfo_path = '.ProductDescription'#'.tab-menu--product' #pdp: .ProductDescription
    @product_page_productrecommodations_path = '.ProductList'#'div.tab-menu--cross-selling' #pdp: .ProductList
    @product_page_productlast_path = '.slick-prev' #'div.last-seen-products'
    @product_page_rememberbutton_path = '.merken'#'.cart--add-to-list' #pdp: .merken
    @product_page_heart_badge_path = '.js--modal' #pdp:
    @product_page_comparebutton_path = '.vergleichen'#'.action--compare' #pdp:
    @product_page_compareicon_path = '.icon--compare'#'.compare--quantity' #pdp: .icon--compare
    @product_page_rate_ratebutton_path = '.tab-menu--product.js--tab-menu > div.tab--navigation > a:nth-child(2)'
    @product_page_rate_tab_menu = 'div.tab-menu--product.js--tab-menu > div.tab--navigation > a'
    @product_page_rate_tab_rateflag = ':nth-child(2)'
    @product_page_rate_form = '#detail--product-reviews'
    @product_page_viewed_tab_menu = '.tab-menu--cross-selling > div > div'
    @product_page_viewed_tab_otherCustomer = ':nth-child(2)'
    @product_page_suggest_container = '.tab-menu--cross-selling > div > div:nth-child(2)'
    update_pathes
  end

  def update_pathes
    #give vars of enviroment to local vars
    @env_country ||= VARS_ENV.r_country
    @env_system ||= VARS_ENV.r_system
    @env_shop ||= VARS_ENV.r_shop

    #pdp
    #hotelwaesche + hw_jobeline
    @product_page_buybutton_path = '.MainProductButtons > div' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productname_path = '.MainProductName' if ("#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/)) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productpicture_path = '.image-gallery' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productconfig_path = '.ProductSelectionBox' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productinfo_path = '.ProductDescription' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productrecommodations_path = '.ProductList' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_rememberbutton_path = '.merken' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_comparebutton_path = '.vergleichen' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_compareicon_path = '.icon--compare' if "#{@env_shop}".match(/hotelwaesche/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/hw_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    #pulsiva
    @product_page_buybutton_path = '.MainProductButtons > div' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_productname_path = '.MainProductName' if ("#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productpicture_path = '.image-gallery' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_productconfig_path = '.ProductSelectionBox' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_productinfo_path = '.ProductDescription' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_productrecommodations_path = '.ProductList' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_rememberbutton_path = '.merken' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_comparebutton_path = '.vergleichen' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_compareicon_path = '.icon--compare' if "#{@env_shop}".match(/pulsiva/) && "#{@env_country}".match(/[a-z]{2}/)
    #vega + v_jobeline
    @product_page_buybutton_path = '.MainProductButtons > div' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productname_path = '.MainProductName' if ("#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/)) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productpicture_path = '.image-gallery' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productconfig_path = '.ProductSelectionBox' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productinfo_path = '.ProductDescription' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_productrecommodations_path = '.ProductList' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_rememberbutton_path = '.merken' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_comparebutton_path = '.vergleichen' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))
    @product_page_compareicon_path = '.icon--compare' if "#{@env_shop}".match(/vega/) && "#{@env_country}".match(/[a-z]{2}/) || ("#{@env_shop}".match(/v_jobeline/) && "#{@env_country}".match(/[a-z]{2}/))

    # define hash of countries
    @product_page_buybutton_path = 'div.product--buybox.block > div > form > div > button' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_productpicture_path = '.product--image-container.image-slider.product--image-zoom' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_productinfo_path = 'div.tab-menu--product.js--tab-menu' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_rememberbutton_path = '.link--notepad' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_heart_badge_path = 'li.navigation--entry.entry--notepad > a > span' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_compareicon_path = '.navigation--entry.entry--compare > i' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_rate_ratebutton_path = 'a.action--link.link--publish-comment' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_viewed_tab_menu = '.tab-menu--cross-selling.js--tab-menu > div.tab--navigation > a' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
    @product_page_suggest_container = '.tab-menu--cross-selling.js--tab-menu > div.tab--navigation > a.tab--link.has--content.is--active' if "#{@env_shop}".match(/chefworks/) && "#{@env_country}".match(/[a-z]{2}/)
  end

end
