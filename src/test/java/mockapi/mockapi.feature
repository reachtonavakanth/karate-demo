@mockapi
Feature: Create application using post api

  Background:
    * url baseUrls.mockApi
    * header Authorization = 'Bearer '+ authToken
    * def FakerUtils = Java.type('utils.FakerUtils')
    * def requestPayload =
	"""
{
    "ApplicantBlock": {
        "applicantID": "APP-20250826-002",
        "fullName": {
            "first": "#(FakerUtils.randomFirstName())",
            "last": "#(FakerUtils.randomLastName())"
        },
        "dob": "1990-04-15",
        "country": "US",
        "employment": {
            "status": "Employed",
            "employerName": "Acme Corp",
            "annualIncome": 85000
        }
    },
    "MetaBlock": {
        "submissionID": "SUB-20250826-XYZ123",
        "submittedBy": "Teller-102",
        "submissionTimestamp": "2025-08-26T10:15:00Z"
    }
}
	"""
    * print requestPayload

  Scenario: Create a user using request from same feature
    Given path 'demo-user-registration'
    And request requestPayload
    When method post
    Then status 200
    * print response