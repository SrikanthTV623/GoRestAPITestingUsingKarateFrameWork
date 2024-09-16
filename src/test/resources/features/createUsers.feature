Feature: Create Users

  Background:
    * def token = 'e1636cf7b6c5370437a57e6383c8e228cfe500cf063f32106aa655e089e31022'
    * def body = read("classpath://json//createUser.json")

  Scenario: Verify user can create new users
    Given url host
    And path '/users'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Authorization = 'Bearer ' + token
    And request body
    When method post
    Then status 201
    * def response = karate.response
    * def userId = response.id
    And print response

    Given url host
    And path '/users/'+ userId
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response