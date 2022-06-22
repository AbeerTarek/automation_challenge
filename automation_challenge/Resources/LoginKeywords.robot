*** Settings ***
Library  SeleniumLibrary
Variables    ../PageObjects.py/LoginLocators.py
Variables    ../PageObjects.py/RegistrationLocators.py

*** Keywords ***
Open my browser
    [Arguments]   ${LoginUrl}     ${browser}
    open browser    ${LoginUrl}     ${browser}
    maximize browser window

Enter Email
    [Arguments]    ${email}
    input text    ${txt_loginEmail}      ${email}

Enter Password
    [Arguments]    ${pass}
    input text    ${txt_loginPassword}       ${pass}


Click Login
    click button    ${btn_login}

Verify Successful Login
    title should be      Facebook


close my browser
    close all browsers


Verify Login Error Message1
        wait until page contains element    class:_9ay7
        page should contain element         class:_9ay7

Verify Login Error Message2
        wait until page contains element    class=_9ay7
        page should contain element         class:_9ay7

Verify Login Error Message3

        wait until page contains element    class=_9ay7
        page should contain element         class:_9ay7


Verify Login Error Message4
        wait until page contains element    class=_9ay7
        page should contain element         class:_9ay7

Verify Login Error Message5
        wait until page contains element    class=_9ay7
        page should contain element         class:_9ay7

Verify Login Error Message6
        wait until page contains element    class=_9ay7
        page should contain element         class:_9ay7


click Forget Password
       click element        ${element_forget}

click Identify Email field
       click element       ${element_identify_email}

Enter Identify Email
        [Arguments]    ${Identify_Email}
        input text     ${txt_identifyEmail}     ${Identify_Email}

click Submit
       click button         ${btn_submit}

Verify Reset Action button
       wait until page contains element    name:reset_action
       page should contain element         name:reset_action

click Reset
       click button         ${btn_reset}

Verify Security Code Page Title
       wait until page contains element            class:uiHeaderTitle
       page should contain element                 class:uiHeaderTitle



