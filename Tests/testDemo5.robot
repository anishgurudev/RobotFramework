*** Settings ***
Documentation       to validate the login

Library             SeleniumLibrary
Library             DataDriver    file=D:/Anish/Practice/RobotFramework/TestData/data.csv    encoding=utf_8    dialect=unix

#    D:/Users/Arpita Malakar/PycharmProjects/RobotFramework/Tests/resource/data.csv
Test Setup          Launch the browser
Test Teardown       Close Browser
Test Template       Validate unSuccessful Login
#Resources


*** Variables ***
${Chromedriver_Path}        C:/Users/Arpita Malakar/Documents/chromedriver
${Browser}                  Chrome
${Base_url}                 https://rahulshettyacademy.com/loginpagePractise/
${ErrorMessage_Xpath}       css:.alert-danger


*** Test Cases ***
Login with user ${username} and password ${password}    default    def123


*** Keywords ***
Validate unSuccessful Login
    [Arguments]    ${username}    ${password}
    open the url
    Fill the login Form    ${username}    ${password}
    wait until it check and display error message
    verify error message is correct

Launch the browser
    Create Webdriver    ${Browser}    executable_path=${Chromedriver_Path}
    #Create Webdriver    Chrome    executable_path=C:/Users/Arpita Malakar/AppData/Local/Programs/Python/Python311/chromedriver
    Maximize Browser Window

open the url
    Go To    ${Base_url}

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

wait until it check and display error message
    Wait Until Element Is Visible    ${ErrorMessage_Xpath}

verify error message is correct
    ${error_message}=    Get Text    ${ErrorMessage_Xpath}
    Should Be Equal As Strings    ${error_message}    Incorrect username/password.
    Element Text Should Be    ${ErrorMessage_Xpath}    Incorrect username/password.
