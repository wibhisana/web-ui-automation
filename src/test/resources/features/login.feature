@Regression
Feature: Login Functionality

  Background:
    Given I am on the login page

  Scenario: Successful login with valid credentials
    Given I have entered a valid username "tomsmith"
    And I have entered a valid password "SuperSecretPassword!"
    When I click the login button
    Then I should see a success message containing "You logged into a secure area!"

  Scenario: Failed login with invalid credentials
    Given I have entered an invalid username "invalidUser"
    And I have entered an invalid password "wrongPassword"
    When I click the login button
    Then I should see an error message containing "Your username is invalid!"

  Scenario: Failed login with empty fields
    Given I leave the username field empty
    And I leave the password field empty
    When I click the login button
    Then I should see an error message containing "Your username is invalid!"

  Scenario: Failed login with excessively long username
    Given I enter a very long username
    And I enter the password "SuperSecretPassword!"
    When I click the login button
    Then I should see an error message containing "Your username is invalid!"

  Scenario: Failed login with valid username and empty password
    Given I enter the valid username "tomsmith"
    And I leave the password field empty
    When I click the login button
    Then I should see an error message containing "Your password is invalid!"
