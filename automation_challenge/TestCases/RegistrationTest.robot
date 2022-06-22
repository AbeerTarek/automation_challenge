*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/RegistrationKeywords.robot


*** Variables ***
${browser}                              chrome
${LoginUrl}                             https://en-gb.facebook.com/
${First_Name}                           hassan
${Last_Name}                            Tarek
${Registration_Email}                   hanaa_tarek@yahoo.com
${Registration_Email_Confirmation}      hanaa_tarek@yahoo.com
${Valid_Registration_Pwd}               2525_Bero
${Invalid_Registration_Pwd}             2525
${Day}                                  1
${Month}                                2
${Year}                                 100

*** Test Cases ***


FacebookRegisteration
#Registration with valid data
    TRY
         Open my browser                                ${LoginUrl}     ${browser}
         sleep    10s
         Click Create New Account
         sleep   3s
         Enter First Name                               ${First_Name}
         Enter Last Name                                ${Last_Name}
         Enter Registration Email                       ${Registration_Email}
         sleep   3s
         Enter Registration Email Confirmation          ${Registration_Email_Confirmation}
         Enter Registration Password                    ${Valid_Registration_Pwd}
         Select Day                                     ${Day}
         Select Month                                   ${Month}
         Select Year                                    ${Year}
         select radio button    sex      1
         click Sign Up
         sleep    50s
         Verify Successful Sign up
         close my browser
         Log to console  " FacebookRegistration1 test Case succeded"
    EXCEPT
         Log To Console   " FacebookRegistration1 test Case failed "
         close my browser
     END


FacebookRegisteration
#Registration with invalid password
    TRY
         Open my browser                                ${LoginUrl}                ${browser}
         sleep    10s
         Click Create New Account
         sleep   3s
         Enter First Name                               ${First_Name}
         Enter Last Name                                ${Last_Name}
         Enter Registration Email                       ${Registration_Email}
         sleep    3s
         Enter Registration Email Confirmation          ${Registration_Email_Confirmation}
         Enter Registration Password                    ${Invalid_Registration_Pwd}
         Select Day                                     ${Day}
         Select Month                                   ${Month}
         Select Year                                    ${Year}
         select radio button    sex      1
         click Sign Up
         sleep      10s
         Verify Password Error Message
         close my browser
         Log to console  " FacebookRegistration2 test Case succeded"
    EXCEPT
         Log To Console   " FacebookRegistration2 test Case failed "
         close my browser
     END
