*** Settings ***
Library  SeleniumLibrary
Variables    ../PageObjects.py/RegistrationLocators.py

*** Keywords ***

Open my browser
    [Arguments]   ${LoginUrl}     ${browser}
    open browser    ${LoginUrl}     ${browser}
    maximize browser window

Click Create New Account
        click element       ${btn_create_new_account}

Enter First Name
    [Arguments]         ${firstName}
    input text          ${txt_first_name}           ${firstName}

Enter Last Name
    [Arguments]         ${lastName}
    input text          ${txt_last_name}           ${lastName}

Enter Registration Email
    [Arguments]         ${registrationEmail}
    input text          ${txt_reg_email}           ${registrationEmail}

Enter Registration Email Confirmation
    [Arguments]         ${registrationEmailConfirmation}
    input text          ${txt_reg_email_confirmation}           ${registrationEmailConfirmation}

Enter Registration Password
    [Arguments]         ${registrationPassword}
    input text          ${txt_reg_password}           ${registrationPassword}

Select Day
    [Arguments]         ${day}
    select from list by index      ${ddl_day}       ${day}

Select Month
    [Arguments]         ${month}
    select from list by index      ${ddl_month}       ${month}

Select Year
    [Arguments]         ${year}
    select from list by index      ${ddl_year}        ${year}

click Sign Up
    click button        ${btn_Sign_up}

Verify Successful Sign up
    wait until page contains element            class=uiHeaderTitle
    page should contain element                 class=uiHeaderTitle

Verify Password Error Message
    wait until page contains element            id:reg_error_inner
    page should contain element                 id:reg_error_inner

close my browser
    close all browsers
