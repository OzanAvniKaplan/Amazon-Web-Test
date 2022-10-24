*** Settings ***
Library           SeleniumLibrary
Library           String
#Library           ImapLibrary2
Library           DateTime
Library           Collections
#Library           ExtendedSelenium2Library
#Library           DebugLibrary


***Comments***
Documentation
...          *** Missing ID ***

*** Variables ***
${SERVER}         localhost:7272
#${REMOTE_URL}    http://localhost:4444/wd/hub
${BROWSER}        Chrome
#${BROWSER}   %{BROWSER}

#----- / URL / -----#
${HomePage}                 https://staging.new-dev-site.algorand.org/
${authenticationURL}        https://algorand:staging@staging.new-dev-site.algorand.org/
# ${SignUpURL}                https://staging.wolarf.com/login
# ${LoginURL}                 https://staging.new-dev-site.algorand.org/
# ${RegisterSupplierURL}      https://staging.wolarf.com/supplier/register
# ${AdminPanelURL}            https://staging.wolarf.com/cp/login
# ${GmailAccountSigninURL}    https://mail.google.com/mail/u/0/?tab=km#inbox
# ${ErrorPageURL}             https://staging.wolarf.com/Error

${document}       ${CURDIR}${/}documents${/}test.pdf


${homepage.pageHeader}              id=page-header
${homepage.headerMenu}              id=header-menu
${homepage.themeButton}             id=theme-button
${homepage.notificationButton}      xpath=//button[contains(@class, "notification-section__button")]

${signIn.button}                    xpath=//a[contains(@class, "button--tertiary typography--small-title page-header__signin-button")]
${signIn.signInForm}                xpath=//div[contains(@class, "form__card")]
${signIn.emailAdressField}          id=id_login
${signIn.passwordField}             id=form-password-input
${signIn.signInForm.signInButton}   xpath=//button[contains(@type, "submit")]

${signIn.userProfile.button}        id=user-section-button
${signIn.userProfile.username}      xpath=//span[contains(@class, "typography--jumbo-body text-color--main user-menu-overlay__user-profile-name")]
${signIn.userProfile.settings}      xpath=//a[contains(@class, "typography--medium-title text-color--gray user-menu-overlay__list-item__anchor")]
${signIn.userProfile.settings.username}     xpath=//div[contains(@class, "form__section-content form__section-content--grid")]//div[contains(@class, "form-field")]//input[contains(@id, "id_username")]

${signIn.homepage.successMessage}   xpath=//p[contains(@class, "typography--jumbo-body message__text text-color--main")]

${signUpButton}                   xpath=//a[contains(@class, "button--primary typography--small-title page-header__signup-button")]


#--- Users ---
${signIn.activeUserEmail}             hipsevtest@gmail.com
${signIn.activeUserPassword}          hipohipo123

# ${email.engineering}           hipsevtest+engineer@gmail.com
# ${email.supplierManager}       hipsevtest+suppliermanager@gmail.com
# ${email.accountManager}        hipsevtest+accmanager@gmail.com
# ${email.adminPanel}            sevgi@hipolabs.com
# ${email.gmailAcc}              hipsevtest@gmail.com
# ${password.engineering}        123123
# ${password.supplierManager}    123123abc
# ${password.accountManager}     123123
# ${password.supplier}           123123abc
# ${password.adminPanel}         123123abc
# ${password.gmailAcc}           Hipofis0864


#--- Texts ---
# ${login.text.welcomeManufacturit}         Welcome to Wolarf
# ${login.text.engineeringName}             Test Engineer
# ${login.text.suplierManager}              Test Supplier manager
# ${login.text.accountManager}              Test ACC Manager
# ${home.text.title}                        HOME



*** Keywords ***
Open Homepage
    Open Browser    ${HomePage}   ${Browser}    algorandDevPortal-webtest
    Maximize Browser Window
    Authentication Box
    Check Login Page

Authentication Box
    Go To       ${authenticationURL}

Check Login Page
    Wait Until Page Contains Element    ${homepage.pageHeader}
    Page Should Contain Element    ${homepage.headerMenu}
    Page Should Contain Element    ${signIn.button}
    Page Should Contain Element    ${signUpButton}
    Page Should Contain Element    ${homepage.themeButton}

Signin With Staff User
    Click SignIn Button
    Wait Until Page Contains Element      ${signIn.emailAdressField}
    input Text    ${signIn.emailAdressField}       ${signIn.activeUserEmail}
    input Text    ${signIn.passwordField}    ${signIn.activeUserPassword}
    Click Element   ${signIn.signInForm.signInButton}

Click SignIn Button
    Click Element     ${signIn.button}
    Wait Until Page Contains Element    ${signIn.signInForm}

Check SignIn User
    Wait Until Page Contains Element    ${homepage.pageHeader}
    Page Should Contain Element    ${homepage.headerMenu}
    Page Should Contain Element    ${signIn.userProfile.button}
    Page Should Contain Element    ${homepage.themeButton}
    Page Should Contain Element    ${homepage.notificationButton}
    Click Profile
    #Click Profile Settings
    Get Username

Click Profile
    Click Element     ${signIn.userProfile.button}

Click Profile Settings
    Wait Until Element Is Visible       ${signIn.userProfile.settings}    timeout=5s
    Click Element     ${signIn.userProfile.settings}

Get Username
#     Execute JavaScript    window.scrollBy(0, 500)
#     #Wait Until Element Is Visible     ${signIn.userProfile.settings.username}
#     ${setting.username}=   Get Text    ${signIn.userProfile.settings.username}
#     Log To Console        ${settings.username}
#     ${successMessage}   Get Text    ${signIn.homepage.successMessage}
#     Log to Console    ${successMessage}
#     Should Be Equal     ${successMessage}   Successfully signed in as ${profile.username}.
    ${profile.username}=      Get Text    ${signIn.userProfile.username}
    Log To Console      ${profile.username}
