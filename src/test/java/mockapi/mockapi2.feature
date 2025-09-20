@mockapi
Feature: Create application using post api2

  Background:
    * url baseUrls.mockApi
    * header Authorization = 'Bearer '+ authToken
    * def FakerUtils = Java.type('utils.FakerUtils')
    * def requestPayload = read('classpath:mockapi/mockapirequest.json')

    * requestPayload.ApplicantBlock.fullName.first = FakerUtils.randomFirstName()
    * requestPayload.ApplicantBlock.fullName.last = FakerUtils.randomLastName()

    * print requestPayload


  Scenario: Create a user by using request from a Json file and expect status code as 200
    Given path 'demo-user-registration'
    And request requestPayload
    When method post
    Then status 200
    * print response

  Scenario: Create a user by using request from a Json file and validate the response
    Given path 'demo-user-registration'
    And request requestPayload
    When method post
    Then status 200
    Then print response
    Then match response.status == 'SUCCESS'
    And match response.applicantID contains 'APP-'

  Scenario: Create a user by using request from a Json file and expect status code as 200 and Validate schema for response
    Given path 'demo-user-registration'
    And request requestPayload
    When method post
    Then status 200
    * print response
    * def userSchema = read('classpath:mockapi/mockapischema.json')
    Then match response == userSchema

  Scenario: Create a user by using request from a Json file for an invalid endpoint and expect status code as 404
    Given path 'demo-user-registrations'
    And request requestPayload
    When method post
    Then status 404
    * print response
