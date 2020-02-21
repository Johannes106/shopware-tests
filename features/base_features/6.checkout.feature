# language: en
Feature: checkout

	As a customer,
	I want to be able to order my favorite products

  @pulsiva
	@vega
	@v_jobeline
	@hotelwaesche
	@hw_jobeline
	@export
	@chefworks
	@checkout
  @checkout_registration
	Scenario: checkout without existing account and create an account
	  Given no user account with my email exists
	  Given I have added a product to the cart
	  And the product cart contains an article
	  When I go to the checkout
	  And I register a new account with my data

		When I set payment
		And I set shipping
		When I click the button to continue on the checkoutpage
	  When I send my order
	  Then Shopware should have my order

	@pulsiva_mobile
	@vega_mobile
	@v_jobeline_mobile
	@hotelwaesche_mobile
	@hw_jobeline_mobile
	@export_mobile
	@chefworks_mobile
  @checkout_mobile
  @checkout_registration_mobile
	Scenario: checkout without existing account and create an account on mobile
	  Given no user account with my email exists
	  Given I am on the website
	  When I add an article to my cart by ajax
	  And the product cart contains an article
	  When I go to the checkout
	  When I touch the box to create an new account
	  When I create a new account with my data
	  When I set payment
	  When I set shipping
	  When I click the button to go to the final page on mobile
	  When I send my order
	  Then Shopware should have my order

	@pulsiva
	@vega
	@v_jobeline
	@hotelwaesche
	@hw_jobeline
	@export
  @checkout_with
  @checkout
	Scenario: checkout with existing account
	  And I already created an user account
	  Given I am logged in
	  When I add an article to my cart by ajax
	  Then the product cart contains an article
	  And I am on the checkout page
		When I am looking for all different paymentmethods
		When I set payment
		And I set shipping
		When I click the button to continue on the checkoutpage
	  When I send my order
	  Then Shopware should have my order

	@pulsiva_mobile
	@vega_mobile
	@v_jobeline_mobile
	@hotelwaesche_mobile
	@hw_jobeline_mobile
	@export_mobile
	@chefworks_mobile
	@checkout_mobile
  @checkout_with_mobile
	Scenario: checkout with existing account on mobile
	  Given no user account with my email exists
	  And I already created an user account
	  Given I am logged in
	  When I add an article to my cart by ajax
	  Then the product cart contains an article
		And I am on the checkout page
		When I send my order
	  Then Shopware should have my order

	@pulsiva
	@vega
	@v_jobeline
	@hotelwaesche
	@hw_jobeline
	@export
  @checkout_without
  @checkout
	Scenario: checkout without existing account and without creating an account
	  Given no user account with my email exists
	  Given I am on the website
	  When I add an article to my cart by ajax
	  And the product cart contains an article
	  When I go to the checkout
	  When I fill out a register form and send it without creating an account
	  When I set payment and shipping
	  When I send my order
	  Then Shopware should have my order
	  And no user account with my email exists

	@pulsiva_mobile
	@vega_mobile
	@v_jobeline_mobile
	@hotelwaesche_mobile
	@hw_jobeline_mobile
	@export_mobile
	@chefworks_mobile
	@checkout_mobile
  @checkout_without_mobile
	Scenario: checkout without existing account and without creating an account on mobile
	  Given no user account with my email exists
	  Given I am on the website
	  When I add an article to my cart by ajax
	  And the product cart contains an article
	  When I go to the checkout
	  When I touch the box to create an new account
	  When I fill out a register form and send it without creating an account
	  When I set payment
	  When I set shipping
	  When I click the button to go to the final page on mobile
	  When I send my order
	  Then Shopware should have my order
	  And no user account with my email exists
