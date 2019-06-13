# language: en
@export
@chefworks

Feature: account

	As a customer,
	I want to be able to use an account
	in order to manage my user data

  Background:
    Given I am on the registration page

	@account
  @export
  @chefworks
  @pulsiva
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @account_registration
	Scenario: create new account
		And no user account with my email exists
		When I create a new account with my data
		Then I should be on my account page

  @account_mobile
  @export_mobile
  @chefworks_mobile
  @pulsiva_mobile
  @vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @account_registration_mobile
	Scenario: create new account on mobile
		And no user account with my email exists
		When I touch the box to create an new account
		When I create a new account with my data
		Then I should be on my account page

  @account
  @export
  @chefworks
  @pulsiva
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @account_login
	Scenario: login with existing account
		Given I already created an user account
		When I login with valid informations
		Then I should be on my account page

  @account_mobile
	@export_mobile
  @chefworks_mobile
  @pulsiva_mobile
  @vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @account_login_mobile
	Scenario: login with existing account on mobile
		Given I already created an user account
		When I log me out
		And I am on the registration page
		When I touch the box for login
		When I login with valid informations
		Then I should be on my account page

 # @account
 # @export
 # @chefworks
 # @pulsiva
 # @vega
 # @hotelwaesche
 # @hw_jobeline
 # @v_jobeline
 # @account_update
 # @account_payment_info
	#Scenario: list all options to pay
	#	Given I am logged in
	#	When I am looking for all different paymentmethods on the account
	#	Then I should see all possibilities of payoptions*/

  @account
  @export
  @chefworks
  @pulsiva
  @vega
  @hotelwaesche
  @hw_jobeline
  @v_jobeline
  @account_update
  @account_payment
	Scenario: modify payment in my account
		Given I am logged in
		When I modify my paymentinfo
		Then I should see a confirmation hint

  @account_mobile
	@export_mobile
  @chefworks_mobile
  @pulsiva_mobile
  @vega_mobile
  @hotelwaesche_mobile
  @hw_jobeline_mobile
  @v_jobeline_mobile
  @account_update_mobile
  @account_payment_mobile
	Scenario: modify payment in my account on mobile
		Given I am logged in
		When I modify my paymentinfo
		Then I should see a confirmation hint

  @account
  @export
  @chefworks
	@account_update
  @account_invoice
	Scenario: modify adress of invoice
		Given I am logged in
		When I modify my address for my bill
		Then I should see a confirmation hint

	@account_mobile
	@export_mobile
  @chefworks_mobile
	@account_update_mobile
  @account_invoice_mobile
	Scenario: modify adress of invoice on mobile
	  Given I am logged in
		When I modify my address for my bill
		Then I should see a confirmation hint

  @account
  @export
  @chefworks
	@pulsiva
	@vega
	@hotelwaesche
	@hw_jobeline
	@v_jobeline
	@account_update
  @account_delivery
	Scenario: modify adress of delivery
	  Given I am logged in
		When I modify my address for my delivery
		Then I should see a new window to manage my addresses

  @account_mobile
  @export_mobile
  @chefworks_mobile
	@pulsiva_mobile
	@vega_mobile
	@hotelwaesche_mobile
	@hw_jobeline_mobile
	@v_jobeline_mobile
	@account_update_mobile
  @account_delivery_mobile
	Scenario: modify adress of delivery on mobile
	  Given I am logged in
		When I modify my address for my delivery
		Then I should see a new window to manage my addresses

  @account
  @export
  @chefworks
	@account_update
  @account_invoice
	Scenario: modify adress of invoice
	  Given I am logged in
		When I modify my address for my bill
		Then I should see a confirmation hint

	@account_mobile
  @export_mobile
  @chefworks_mobile
	@account_update_mobile
  @account_invoice_mobile
	Scenario: modify adress of invoice on mobile
	  Given I am logged in
		When I modify my address for my bill
		Then I should see a confirmation hint

	@account
  @export
  @chefworks
	@account_newsletter
  Scenario: change settings for newsletter
    Given I am logged in
		When I activate the newsletterbox
		Then I should see a confirmation hint

	@account_mobile
	@export_mobile
  @chefworks_mobile
	@account_newsletter_mobile
  Scenario: change settings for newsletter on mobile
    Given I am logged in
		When I activate the newsletterbox
		Then I should see a confirmation hint

	@account
  @export
  @chefworks
  @pulsiva
  @vega
  @hotelwaesche
  @v_jobeline
	@account_links
  Scenario: test links on the accountsite
		Given I am logged in
		When I get all items of the sidebar

  @account_mobile
  @export_mobile
  @chefworks_mobile
  @pulsiva_mobile
  @vega_mobile
  @hotelwaesche_mobile
  @v_jobeline_mobile
	@account_links_mobile
  Scenario: test links on the accountsite on mobile
		Given I am logged in
		When I get all items of the sidebar

  @account
  @vega
  @v_jobeline
  @account_advanced
  @account_login_subshop
	Scenario: login with existing account in subshop
		Given I already created an user account on Vega in DE
		When I login with valid informations on Jobeline in DE
		Then I should be on my account page on the subshop

	@account
  @vega
  @v_jobeline
  @account_advanced
  @account_login_foreign
	Scenario: login with account in shop of other country
		Given I already created an user account on Vega in DE
		When I login with valid informations on Vega in AT
		Then I should get an errormessage
