# language: en
Feature: search

    As a customer
    I will be able to search for a specific product

    @quickies
    @pulsiva
    @vega
    @hotelwaesche
    @hw_jobeline
    @v_jobeline
    @export
    @chefworks
    @search
    @search_sku
    Scenario: search with sku
        Given I am on the website
        When I am searching for a product by entering the sku in the searchfield
        Then I should be on the detailsite of the related product

    @pulsiva
    @vega
    @hotelwaesche
    @hw_jobeline
    @v_jobeline
    @export
    @search
    @search_number
    Scenario: search with productnumber
        Given I am on the website
        When I am searching for a product by entering the productnumber in the searchfield
        Then I should be on the detailsite of the related product

    @pulsiva
    @vega
    @hotelwaesche
    @hw_jobeline
    @v_jobeline
    @export
    @search
    @search_name
    Scenario: search with name
        Given I am on the website
        When I am searching for products by entering the productname in the searchfield
        Then I should see my product on the results of my search

    @pulsiva_mobile
    @vega_mobile
    @hotelwaesche_mobile
    @hw_jobeline_mobile
    @v_jobeline_mobile
    @export_mobile
    @chefworks_mobile
    @search_mobile
    @search_sku_mobile
    Scenario: search with sku
        Given I am on the website
        When I am searching for a product by entering the sku in the searchfield
        Then I should be on the detailsite of the related product
