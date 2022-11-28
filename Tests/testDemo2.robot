*** Settings ***
Documentation       to validate the login

Library             SeleniumLibrary
Library             Collections
#Test Teardown    Close Browser Session
Resource            ../resource/resource.robot

Test Setup          Launch the browser


*** Variables ***
${ErrorMessage_Xpath}           css:.alert-danger
${ShopPage_Checkout_Btn}        css:.nav-link.btn.btn-primary
${ShopPage_CardTiles}           css:.card-title
${loginPage_user_Radio_Btn}     css:input[value='user']


*** Test Cases ***
#Validate unSuccessful Login
#    open the url
 #    Fill the login Form    ${user_name}    ${invalid_password}
 #    wait until element is visible on screen    ${ErrorMessage_Xpath}
 #    verify error message is correct

Validate Cards Display in the Shopping page
    open the url
    Fill the login Form    ${user_name}    ${valid_password}
    wait until element is visible on screen    ${ShopPage_Checkout_Btn}
    verify Card titles in the shop page
    #scroll till Element    xpath:(//*[@class='card-footer'])[4]/button
    select the card    Nokia Edge
    scroll till Element    ${ShopPage_Checkout_Btn}

Select the form and navigate to child window
    open the url
    Fill tthe login details and select the user option    ${user_name}    ${valid_password}


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

verify Card titles in the shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${cardElements} =    Get WebElements    ${ShopPage_CardTiles}
    @{actualList} =    Create List
    FOR    ${cardElement}    IN    @{cardElements}
        Log    ${cardElement.text}
        Append To List    ${actualList}    ${cardElement.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

select the card
    [Arguments]    ${cardName}
    ${cardElements} =    Get WebElements    ${ShopPage_CardTiles}
    ${index} =    Set Variable    1
    FOR    ${cardElement}    IN    @{cardElements}
        Log    ${cardElement.text}
        IF    '${cardName}' == '${cardElement.text}'    BREAK
        ${index} =    Evaluate    ${index} +1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

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
