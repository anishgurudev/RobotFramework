*** Settings ***
Documentation       to validate the login

Library             SeleniumLibrary
Library             String
Library             Collections
Resource            ../resource/resource.robot

Test Setup          Launch the browser
Test Teardown       Close Browser


*** Test Cases ***
Validate child window functionality
    open the url
    select the link of child window
    verify the user is switched to child window
    grab the Email id in the child window
    switch back to parent window and enter the Email


*** Keywords ***
select the link of child window
    Click Element    css:.blinkingText
    sleep    5

verify the user is switched to child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

grab the Email id in the child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    #0 -> please email u
    #1 -> mentor@rahulshettyacademy.com with below template to recieve responces
    ${split_text}=    Get From List    ${words}    1
    log    ${split_text}
    @{words1}=    Split String    ${split_text}
    #0 -> mentor@rahulshettyacademy.com
    ${EmailId}=    Get From List    ${words1}    0
    log    ${EmailId}
    Set Global Variable    ${EmailId}

switch back to parent window and enter the Email
    Switch Window    MAIN
    ${title}=    Get Title
    log    ${title}
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${EmailId}
