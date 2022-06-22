*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/LoginKeywords.robot

*** Variables ***
${browser}               chrome
${LoginUrl}              https://en-gb.facebook.com/
${Validmail}            tlmaamwssk_1655512374@tfbnw.net
${invalidmail}          tlmaamwssk_1655512374@tfbnw
${Validpwd}             2525_Bero
${invalidpwd}           2525
${IdentifyEmail}        tlmaamwssk_1655512374@tfbnw.net


*** Test Cases ***

FacebookLogin1
#Login with valid email & valid password
    TRY
        Open my browser     ${LoginUrl}     ${browser}
        sleep    10s
        Enter Email         ${Validmail}
        Enter Password      ${Validpwd}
        Click Login
        sleep    50s
        Verify Successful Login
        close my browser
        Log To Console    " Login succeeded "

    EXCEPT
        Log To Console   " FacebookLogin1 Test Case failed "
        close my browser
    END

FacebookLogin2
#Login with valid email & invalid password
    TRY
        Open my browser     ${LoginUrl}     ${browser}
        sleep    10s
        Enter Email         ${Validmail}
        Enter Password      ${invalidpwd}
        Click Login
        sleep    30s
        Verify Login Error Message1
        close my browser
        Log To Console    " The password that you've entered is incorrect. "
    EXCEPT
        Log To Console   " FacebookLogin2 Test Case failed "
        close my browser
    END

FacebookLogin3
#Login with invalid email & valid password
    TRY
        Open my browser     ${LoginUrl}     ${browser}
        sleep    10s
        Enter Email         ${invalidmail}
        Enter Password      ${validpwd}
        Click Login
        sleep    30s
        Verify Login Error Message2
        close my browser
        Log To Console    " The email address or mobile number you entered isn't connected to an account. "

    EXCEPT
        Log To Console   " FacebookLogin3 Test Case failed "
        close my browser
    END

FacebookLogin4
#Login with invalid email & invalid password
    TRY
        Open my browser     ${LoginUrl}     ${browser}
        sleep    10s
        Enter Email         ${invalidmail}
        Enter Password      ${invalidpwd}
        Click Login
        sleep    30s
        Verify Login Error Message3
        close my browser
        Log To Console    " The email address or mobile number you entered isn't connected to an account.   "
    EXCEPT
        Log To Console   " FacebookLogin4 Test Case failed "
        close my browser
    END


FacebookLogin5
#Login with empty email & valid password
    TRY
        Open my browser     ${LoginUrl}     ${browser}
        sleep    10s
        Enter Email         ${EMPTY}
        Enter Password      ${validpwd}
        Click Login
        sleep    30s
        Verify Login Error Message4
        close my browser
        Log To Console    " The email address or mobile number you entered isn't connected to an account. "
    EXCEPT
        Log To Console   " FacebookLogin5 Test Case failed "
        close my browser
    END

FacebookLogin6
#Login with valid email & empty password
    TRY
         Open my browser     ${LoginUrl}     ${browser}
         sleep    10s
         Enter Email         ${Validmail}
         Enter Password      ${EMPTY}
         Click Login
         sleep    30s
         Verify Login Error Message5
         close my browser
         Log To Console    " The password that you've entered is incorrect. "
    EXCEPT
         Log To Console   " FacebookLogin6 Test Case failed "
         close my browser
    END

FacebookLogin7
#Login with empty email & empty password
    TRY
         Open my browser     ${LoginUrl}     ${browser}
         sleep    10s
         Enter Email         ${EMPTY}
         Enter Password      ${EMPTY}
         Click Login
         sleep    30s
         Verify Login Error Message6
         close my browser
         Log To Console    " The email address or mobile number you entered isn't connected to an account. "
    EXCEPT
         Log To Console   " FacebookLogin7 Test Case failed "
         close my browser
    END

ForgetPassword
#Forget password flow
     TRY
         Open my browser                     ${LoginUrl}     ${browser}
         sleep    10s
         click Forget Password
         wait until page contains element    id:identify_email
         page should contain element         id:identify_email
         click Identify Email field
         Enter Identify Email                ${IdentifyEmail}
         sleep    2
         click Submit
         Verify Reset Action button
         click Reset
         Verify Security Code Page Title
         close my browser
         Log To Console    " Enter security code page opened successfully "
    EXCEPT
         Log To Console   " ForgetPassword Test Case failed "
         close my browser
    END


