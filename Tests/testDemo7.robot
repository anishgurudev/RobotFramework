*** Settings ***
Documentation       to validate the login page objects objects

Library             SeleniumLibrary
Library             Collections
#Library    ../customLibraries/Shop.py
Resource            ../resource/resource.robot
Resource            ../PageUtils/LoginPage.robot
Resource            ../PageUtils/ShopPage.robot

Suite Setup         Launch the browser
Suite Teardown      Close Browser Session
Test Setup          open the url


*** Test Cases ***
Validate Cards Display in the Shopping page
    Fill the login Form    ${user_name}    ${valid_password}
    wait until element is visible on screen    ${ShopPage_Checkout_Btn}
    verify Card titles in the shop page
    #scroll till Element    xpath:(//*[@class='card-footer'])[4]/button
    select the card    Nokia Edge
 #    Hello Test
    scroll till Element    ${ShopPage_Checkout_Btn}

Select the form and navigate to child window
    Fill tthe login details and select the user option    ${user_name}    ${valid_password}
