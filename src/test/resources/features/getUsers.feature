Feature: Get User Details

  Background:
    * def responseOfCreateUsers = call read("classpath://features/createUsers.feature")

  Scenario: Verify user can retrieve user details
    Given url host
    And path '/users/'+responseOfCreateBooking.response.id
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response



