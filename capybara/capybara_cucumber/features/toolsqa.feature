Feature: I am able to access and test the toolsqa form page

  Scenario Outline: I can access the toolsqa site and apply page actions
    Given I can access the toolsqa site
    When I apply particular find actions <user>
    Then they apply the actions correctly

  Examples:
  	| user   |
  	|	test_1 |
  	|	test_2 |
  	|	test_3 |
  	|	test_4 |

  Scenario: I can access the toolsqa site and apply page actions
    Given I can access the toolsqa site
    When I apply particular find actions
    Then they apply the actions correctly
    
    

