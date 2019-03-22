# language: en
Feature: website_basics

    As a customer
    i will be able to register me the newsletter
    to get a newsletter sent

@newsletter
@newsletter_footer
Scenario: register for newsletter within the footer
  Given I am on the website
  When I enter a mailaddress into the field of newsletter registration
  And I push the send button
  And I fill out the register form
  And I save the form
  Then I should see a box of acception
  Then I should find the mailaddress in emarsys

@newsletter
@newsletter_account
@newsletter_account_unregister_register
Scenario: unregister and register for newsletter within my account
  Given I am logged in
  When I set the option to get a newsletter
  Then I should see a hint for changing settings

@newsletter
@newsletter_checkout
@newsletter_checkout_newsletter
Scenario: complete an order to get a newsletter
  Given I have completed an order
  When my mailaddress was sent to emarsys automatically
  Then I should find the mailaddress in emarsys
