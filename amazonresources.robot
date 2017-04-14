*** Settings ***
Library           Selenium2Library
Library           String

*** Variables ***

${browser}           Chrome
${URL}               https://www.amazon.com/
${userEmail}         test.auto.amazon@gmail.com
${userPassword}      amazon123
${searchText}        samsung

#Fields
${emailField}         xpath=//input[@id="ap_email"]
${passwordField}      xpath=//input[@id="ap_password"]
${searchField}        xpath=//input[@id="twotabsearchtextbox"]

#Buttons
${signInButton}        xpath=//a[contains(@id, "nav-link-accountList")]
${secondPageButton}    xpath=//span[contains(@class, "pagnLink")][1]

${secondPageControl}    xpath=//span[contains(@class, "pagnCur")][1]
${chooseThirdProduct}   xpath=//li[contains(@id, "result_26")]//div[contains(@class, "a-fixed-left-grid-col a-col-left")]
${addToWish}            xpath=//input[contains(@name, "submit.add-to-registry.wishlist")]
${viewYourList}         xpath=//a[contains(@class, "w-button")]
${deleteButton}         xpath=//input[contains(@name, "submit.deleteItem")]

*** Keywords ***

Login
  Open Browser    ${URL}    ${browser}     moment-webtest
  Home Page Should Be Open
  Click Sign In
  Input Username
  Input Password
  Submit Form
  Log To Console    'Login Successfully'

Click Sign In
  sleep    2s
  Click Element    ${signInButton}
  Log To Console    'Clicked Sign In Button'

Home Page Should Be Open
  Title Should Be    Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more
  Log To Console    'Opened Homepage'

Input Username
  Wait Until Page Contains Element    ${emailField}
  sleep    2s
  Input Text     name=email    ${userEmail}
  Log To Console    'Entered UserName'

Input Password
  Wait Until Page Contains Element    ${passwordField}
  sleep    2s
  Input Text     name=password    ${userPassword}
  Log To Console    'Entered Password'

Search
  Wait Until Page Contains Element    ${searchField}
  sleep    2s
  Input Text     id=twotabsearchtextbox    ${searchText}
  Log To Console    'Entered Search'
  Submit Form
  Log To Console    'Search Successfully'
  Page Should Contain    Showing most relevant results. See all results for samsung.
  Log To Console    'Controlled Text'

Results Second Page
  sleep    2s
  Click Element    ${secondPageButton}
  Log To Console    'Second Page Opened'
  Page Should Contain Element    ${secondPageControl}
  Log To Console    'Controlled Second Page Opened'

Wish List Test
  Click Element    ${chooseThirdProduct}
  Log To Console    'Selected Third Product'
  sleep    3s
  Click Element    ${addToWish}
  Log To Console    'Added To Wish List'
  sleep    3s
  Click Element    ${viewYourList}
  sleep    3s
  Page Should Contain Element    xpath=//div[contains(@class, "a-text-center a-fixed-left-grid-col g-itemImage g-item-sortable-padding a-col-right")]
  Log To Console    'Controlled To Added To Wish List'
  sleep    2s
  Click Element    ${deleteButton}
  Log To Console    'Deleted From Wish List'
  sleep    2s
  Page Should Not Contain Element    xpath=//div[contains(@class, "a-text-center a-fixed-left-grid-col g-itemImage g-item-sortable-padding a-col-right")]
  Log To Console    'Controlled To Deleted From Wish List'
