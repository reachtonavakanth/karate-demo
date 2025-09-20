@usercreation
Feature: New User Creation

  Scenario: Get users based on the provided Page number, get FirstName & LastName of the first user and create user using the same FirstName & LastName
    Given url baseUrls.reqresApi
    And  path 'users'
    And params { page: 2, per_page: 5 }
    * def scenarioHeaders = karate.merge(headers, { 'x-api-key': 'reqres-free-v1'})
    And headers scenarioHeaders
    When method get
    Then status 200
    * print response
    * def firstUser = response.data[0]
    * def firstName = firstUser.first_name
    * def lastName = firstUser.last_name
    * print firstName, lastName

    Given url baseUrls.mockApi
    * header Authorization = 'Bearer '+ authToken
    * def requestPayload = read('classpath:mockapi/mockapirequest.json')
    * requestPayload.ApplicantBlock.fullName.first = firstName
    * requestPayload.ApplicantBlock.fullName.last = lastName
    * print requestPayload
    Given path 'demo-user-registration'
    And request requestPayload
    When method post
    Then status 200
    * print response