*** Settings ***
Library           Selenium2Library
Resource          amazonresources.robot

*** Variables ***



*** Test Cases ***
Test Log In
  Login
  #[Teardown]    close browser

Test Search
  Login
  Search
  Results Second Page
  Wish List Test
  #[Teardown]    close browser
