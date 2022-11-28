*** Settings ***
Documentation       to validate the login

Library             SeleniumLibrary

Test Setup          Launch the browser
Test Teardown       Close Browser
#Resources


*** Variables ***
${Chromedriver_Path}        C:/Users/Arpita Malakar/Documents/chromedriver
${Browser}                  Chrome
${Base_url}                 https://rahulshettyacademy.com/loginpagePractise/
${ErrorMessage_Xpath}       css:.alert-danger


*** Test Cases ***
Validate unSuccessful Login
    open the url
    Fill the login Form
    wait until it check and display error message
    verify error message is correct


*** Keywords ***
Launch the browser
    Create Webdriver    ${Browser}    executable_path=${Chromedriver_Path}
    #Create Webdriver    Chrome    executable_path=C:/Users/Arpita Malakar/AppData/Local/Programs/Python/Python311/chromedriver
    Maximize Browser Window

open the url
    Go To    ${Base_url}

Fill the login Form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345667
    Click Button    signInBtn

wait until it check and display error message
    Wait Until Element Is Visible    ${ErrorMessage_Xpath}

verify error message is correct
    ${error_message}=    Get Text    ${ErrorMessage_Xpath}
    Should Be Equal As Strings    ${error_message}    Incorrect username/password.
    Element Text Should Be    ${ErrorMessage_Xpath}    Incorrect username/password.
