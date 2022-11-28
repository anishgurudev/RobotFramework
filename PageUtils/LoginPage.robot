*** Settings ***
Documentation       All the page objects and Keyword of landing page.

Library             SeleniumLibrary
Resource            ../resource/resource.robot


*** Variables ***
${ErrorMessage_Xpath}           css:.alert-danger
${loginPage_user_Radio_Btn}     css:input[value='user']


*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

verify error message is correct
    ${error_message} =    Get Text    ${ErrorMessage_Xpath}
    Should Be Equal As Strings    ${error_message}    Incorrect username/password.
    Element Text Should Be    ${ErrorMessage_Xpath}    Incorrect username/password.

Fill tthe login details and select the user option
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Element    ${loginPage_user_Radio_Btn}
    Select From List By Value    css:select.form-control    teach
    wait until element is visible on screen    css:.modal-content
    click element    id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-content
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
