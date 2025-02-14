*** Settings ***
Documentation            Login screen elements and actions

Library                  AppiumLibrary

*** Variables ***
${API_IP}        172.18.176.1

*** Keywords ***
Do login
    Input Text            xpath=//*[@resource-id="apiIp"]            ${API_IP}
    Click Element         xpath=//*[@resource-id="signInButton"]