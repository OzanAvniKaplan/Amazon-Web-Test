*** Settings ***
Library           SeleniumLibrary
Resource          algorandDevPortal_resources.robot

***Comments***
Documentation
...                 *** Case ***                                                        *** Problems ***
...

...                 *** Uncompleted Cases ***
...                 Test Signin User                                         #After clicking profile, there should be compared username and success message.
...                                                                           for the username get text is not working right now in the "Get Username" case. After it should research.



...                 *** Completed Cases ***
...


*** Test Cases ***
Test Signin User
    Open Homepage
    Signin With Staff User
    Check SignIn User
    #Logout Engineering
    #[Teardown]    close browser
