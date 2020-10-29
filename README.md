# shopware_tests
## Automated Feature Testing
This is functional testing for webshops of vega, jobeline, hotelwaesche, pulsiva, chefworks.

### Following **test-cases/features** exists:
- content
- website basics
- search
- direct_order
- product_page
- product_cart
- account (contains registration)
- checkout

#### website_basics
  - website-elements
    : check for basic elements via css-pathes
  - navigation
    - hovermenu
      : check possibility of navigating with hovering
    - standardmenu
      : check possibility of navigating with menu
    - links
      - check internal links
        - link to account
        - link to cart
        - link to note
        - link to help
      - check links of digital publishing for the correct country
      - check possibility to change the language
     - mobile:
         : use burgermenu

#### search
  - search by sku
    : look for availibility of given sku
  - search by productnumber
    : look for availibility of given productnumber in results
  - search by name
    : look for availibility of given product in results

#### direct_ordering
  - add an article as a direct order
    : put the article into the cart

#### product_page
  - notice an article
    : look for hint
  - compare an article
    : look for compare-icon
  - add an article
    : look for opened productcart on the right
  - display data of an article
    : look for visibility of informations about the article
  - rate an article
    - rate by clicking tab
      : look for the form of rating
    - rate by clicking button
      : look for the form of rating
  - check visibility of last seen articles

#### product_cart
  - continue shopping
    : exit product cart and continue with shopping
  - add article additionally
  - enter voucher
  - remove article
  - show data of article
    : find all informationboxes
  - navigate to checkout

#### account
  - registration
    : create new account
  - login
    : log in to account
  - update
    : modify data of account
    - userinfo
      : change info of user
    - payment
      : change data of payment
    - bill
      : change data of invoice
    - delivery
      : change data of delivery
  - newsletter
    : change settings for newsletter
  - links
    : test links on the accountsite
  - subshop (only vega)
    : ability to login into jobeline(tabbed) with data of vega --> success  
    : ability to login in a shop of vega it two different countries --> failure  

#### checkout
  - with
    : checkout with an existing account
  - without
    : checkout as an unregistered user
  - registration
    : register and checkout an user

#### content
  - check servers
    : check delivery of all servers

##### Following tags exist:
To start different tests on each mandant navigate via tags:
- @pulsiva
- @vega
- @v_jobeline
- @hotelwaesche
- @hw_jobeline
- @export
- @chefworks
- @website_basics
- @website_elements
- @navigation
- @menu
- @hovermenu
- @standardmenu
- @menu
- @links
- @search
- @direct_order
- @product_page
- @product_page_compare
- @product_page_add
- @product_page_data
- @product_page_rate   
- @product_page_suggest
- @product_cart
- @product_cart_continue
- @product_cart_add
- @product_cart_voucher
- @product_cart_remove
- @product_cart_data
- @product_cart_checkout
- @account
- @account_registration
- @account_login
- @account_update
- @account_invoice
- @account_delivery
- @account_newsletter
- @account_links
- @checkout
- @checkout_with
- @checkout_registration
- @checkout_without
- @content

##### Following options for browsers exist:
- firefox
- ie
- chrome
- safari
- iPad
- iPhone

###### to start tests:
Syntax (bash-shellaufruf): bash run_cucumber.sh <testenviroment-system> <browser> <apiuser> <apikey> <sauceuser> <saucekey> <test-system> <testshop> <country> <tag>
bash run_cucumber.sh saucelabs <browser> <htaccess_user> <htaccess_key> <shopware_apiuser_name> <shopware_apiuser_key> <saucelabs_user_name> <saucelabs_api_key> live vega de @vega
bash run_cucumber.sh saucelabs <browser> <htaccess_user> <htaccess_key> <shopware_apiuser_name> <shopware_apiuser_key> <saucelabs_user_name> <saucelabs_api_key> int chefworks de @chefworks
bash run_cucumber.sh saucelabs <browser> <htaccess_user> <htaccess_key> <shopware_apiuser_name> <shopware_apiuser_key> <saucelabs_user_name> <saucelabs_api_key> int pulsiva at @pulsiva
