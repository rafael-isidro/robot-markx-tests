*** Settings ***
Documentation        Testes de Login

Resource        ../resources/base.resource

*** Test Cases ***
Deve logar com sucesso

    Open Application    http://localhost:4723
    ...        automationName=uiautomator2
    ...        platformName=Android
    ...        deviceName=Emulator
    ...        udid=emulator-5554
    ...        autoGrantPermissions=true
    ...        app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    Endereço IP da Api    10

    Input Text                  xpath=//*[@resource-id="apiIp"]            172.18.176.1
    Click Element               xpath=//*[@resource-id="signInButton"]

    Wait Until Page Contains        Minhas tarefas        

    Close Application 