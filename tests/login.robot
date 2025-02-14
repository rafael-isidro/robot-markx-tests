*** Settings ***
Documentation        Testes de Login

Resource        ../resources/base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve logar com sucesso
    Input Text                  xpath=//*[@resource-id="apiIp"]            172.18.176.1
    Click Element               xpath=//*[@resource-id="signInButton"]

    Wait Until Page Contains        Minhas tarefas        
