*** Settings ***
Documentation   to validate the login
Library     SeleniumLibrary
Test Setup    open the browser
Test Teardown   Close browser
#Resources


*** Variables ***
${Chromedriver_Path}        C:/Users/Arpita Malakar/Documents/chromedriver
${Browser}                  Chrome
${Base_url}                 https://Flipkart.com

*** Test Cases ***
Validate unSuccessful Login
   open the url
#    Fill the login Form
#    wait until it check and display error message
#    verify error message is correct


*** Keywords ***
open the browser
   Create Webdriver     ${Browser}   executable_path=${Chromedriver_Path}
   #Create Webdriver     Chrome   executable_path=C:/Users/Arpita Malakar/AppData/Local/Programs/Python/Python311/chromedriver

open the url
   Go To   ${Base_url}



