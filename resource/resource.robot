*** Settings ***
Documentation  A resource file with reusable keyword & variables
# The system speciafic keywords created here from our own domain speciafic language. they utilize keywords provived by thehimported seleniumLibrary.*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${Browser}              Chrome
${Chromedriver_Path}        chromedriver

${Base_url}             https://rahulshettyacademy.com/loginpagePractise/

${user_name}            rahulshettyacademy
${invalid_password}     123456788
${valid_password}       learning


*** Keywords ***
Launch the browser
   Create Webdriver     ${Browser}   executable_path=${Chromedriver_Path}
   #Create Webdriver     Chrome   executable_path=C:/Users/Arpita Malakar/AppData/Local/Programs/Python/Python311/chromedriver
   Maximize Browser Window

open the url
   Go To   ${Base_url}

wait until element is visible on screen
    [arguments]     ${element}
    Wait Until Element Is Visible    ${element}

scroll till Element
    [arguments]  ${element}
    Scroll Element Into View        ${element}

Close Browser Session
    Close Browser