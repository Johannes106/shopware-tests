# language: en

@export
@product_cart
Feature: product_cart

	As a customer,
	I want to be able to put a product into my cart
	in order to manage my chosen products

  @pulsiva
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @product_cart_continue
    Scenario: continue shopping
      Given I have added a product to the cart
      And I am on the product cart page
      When I click on the button to continue shopping
  	  Then I will see the back on the productsite

	@pulsiva_mobile
  @vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @product_cart_continue_mobile
  @product_cart_mobile
    Scenario: continue shopping
      Given I have added a product to the cart
      And I am on the product cart page
      When I click on the button to continue shopping
  	  Then I will see the back on the productsite

	@chefworks

	  @pulsiva
	  @vega
	  @hotelwaesche
	  @hw_jobeline
	  @v_jobeline
	@product_cart_add
    Scenario: add article additionally
      Given I am on the product page of an article
			When I add an article to the product cart by clicking the button to push it into the cart
			Then I should see this article in the product cart
			Given I am on the website
			When I am looking for another article on the website
			And I add an article to the product cart by clicking the button to push it into the cart
      Then I should see an article in the product cart

  @chefworks
  @pulsiva
  @product_cart_voucher
    Scenario: enter a code of a voucher
      Given I have added a product to the cart
      When I activate the function for voucher
	    And I enter some code into the optional field
  	  Then there should be the voucher-action in the url

	@chefworks
	@pulsiva
	@vega
	@hotelwaesche
	@hw_jobeline
	@v_jobeline
  @product_cart_remove
    Scenario: remove an article
      Given I have added a product to the cart
      Then the product cart contains an article
	    When I remove this article from the product cart
  	  Then the cart should not contain this article

	@chefworks_mobile
	@pulsiva_mobile
	@vega_mobile
	@hotelwaesche_mobile
	@hw_jobeline_mobile
	@v_jobeline_mobile
  @product_cart_remove_mobile
  @product_cart_mobile
    Scenario: remove an article
      Given I have added a product to the cart
      Then the product cart contains an article
	    When I remove this article from the product cart
  	  Then the cart should not contain this article

  @chefworks
  @pulsiva
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @product_cart_data
    Scenario: display articles with data
      Given I have added a product to the cart
      And the product cart contains an article
      Then I should see all necessary informations about this article within the product list of the product cart

  @chefworks_mobile
  @pulsiva_mobile
  @vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @product_cart_data_mobile
  @product_cart_mobile
    Scenario: display articles with data
      Given I have added a product to the cart
      And the product cart contains an article
      Then I should see all necessary informations about this article within the product list of the product cart

  @chefworks
  @vega
  @hw_jobeline
  @v_jobeline
  @hotelwaesche
  @quickies
  @product_cart_checkout
	  Scenario: navigate to checkout
	    Given I have added a product to the cart
	    And the product cart contains an article
	    When I navigate to the checkout by clicking the button which navigates to the checkout
	    Then I should be on the checkout-page

	@chefworks_mobile
  @vega_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @hotelwaesche_mobile
  @product_cart_checkout_mobile
  @product_cart_mobile
	  Scenario: navigate to checkout
	    Given I have added a product to the cart
	    And the product cart contains an article
	    When I navigate to the checkout by clicking the button which navigates to the checkout
	    Then I should be on the checkout-page
