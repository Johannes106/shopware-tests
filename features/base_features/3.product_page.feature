# language: en

@pulsiva
@chefworks
@product_page
Feature: product page

	As a customer,
	I want to have the opportunity to use the features of the product page
    
  @quickies
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @export
  @product_page_website
  Scenario: go to a product page
    Given I am on the website
    When I am searching for a product by entering the sku in the searchfield
    Then I should be on the detailsite of the related product
    And set the url of the product page
  
  
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @export
  @product_page_note
  Scenario: notice an article
    Given I am on the product page of an article
	  When I press the remember-button
	  Then there should see a hint
	
	@vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @product_page_note_mobile
  @product_page_mobile
  Scenario: notice an article
    Given I am on the product page of an article
	  When I press the remember-button
	  Then there should see a hint
	
	@vega
	@hotelwaesche
	@hw_jobeline
	@v_jobeline
  @export
  @product_page_compare	
  Scenario: compare an article
    Given I am on the product page of an article
	  When I press the compare-button
	  Then there should see the icon to compare

  @quickies
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @export
  @product_page_add
  Scenario: add an article to the product cart by clicking button 
    Given I am on the product page of an article
    When I add an article to the product cart by clicking the button to push it into the cart
    Then I should see the cart on the right of the site

  @vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @product_page_add_mobile
  @product_page_mobile
  Scenario: add an article to the product cart by clicking button
    Given I am on the product page of an article
    When I add an article to the product cart by clicking the button to push it into the cart
    Then I should see the cart on the right of the site

  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @export
  @product_page_data
  Scenario: display products with data
    Given I am on the product page of an article
	  Then I should see all necessary elememts for getting more informations about this article

  @vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @product_page_data_mobile
  @product_page_mobile
  Scenario: display products with data
    Given I am on the product page of an article
	  Then I should see all necessary elememts for getting more informations about this article

  @chefworks
  @export
  @product_page_rate
  Scenario: rate an article with tab
    Given I am on the product page of an article
	  When I change in the tab to the rating
	  Then there should be a form for rating the article
	  
	@chefworks
	@export
	@product_page_rate
  Scenario: rate an article with button
    Given I am on the product page of an article
	  When I click the button to rate for the article
	  Then there should be a form for rating the article
	
	@chefworks
	@product_page_suggest
  Scenario: customer seen article
    Given I am on the product page of an article
	  When I change to the tab of the customer viewed articles
	  Then there should be a box of some articles