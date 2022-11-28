*** Settings ***
Documentation       All the page objects and Keyword of Shop page.

Library             SeleniumLibrary
Library             Collections


*** Variables ***
${ShopPage_Checkout_Btn}    css:.nav-link.btn.btn-primary
${ShopPage_CardTiles}       css:.card-title


*** Keywords ***
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
        IF    '${cardName}' == '${cardElement.text}'            BREAK
        ${index} =    Evaluate    ${index} +1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
