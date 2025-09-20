@reqres
Feature: Get users using Pagination

  Background:
    * url baseUrls.reqresApi
#    * configure baseHeaders = headers

  Scenario: Get users based on the Page number using valid x-api-key, expect status code as 200 and Validate the response schema
    Given path 'users'
    And params { page: 2, per_page: 5 }
    * def scenarioHeaders = karate.merge(headers, { 'x-api-key': 'reqres-free-v1'})
    And headers scenarioHeaders
    When method get
    Then status 200
    * print response
    * def userSchema = read('classpath:reqres/getUsersBySchema.json')
    Then match response == userSchema

  Scenario: Get users based on the Page number using Invalid x-api-key and expect status code as 200
    Given path 'users'
    And params { page: 2, per_page: 5 }
    * def scenarioHeaders = karate.merge(headers, { 'x-api-key': 'reqres-freee-v1'})
    And headers scenarioHeaders
    When method get
    Then status 200
    * print response