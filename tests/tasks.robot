*** Settings ***
Documentation           Task registration test suite

Resource                ${EXECDIR}/resources/base.resource

Test Setup              Start session
Test Teardown           Finish session

*** Test Cases ***
Deve cadastrar uma nova tarefa com sucesso
    ${task}        Set Variable        Estudar testes com Appium e Robot
    
    Do login
    Create a new task            ${task}
    Should have task             ${task}

    Remove task from database    ${task}

Deve remover uma tarefa indesejada
    [Tags]    remove
    ${task}        Set Variable        Ir ao mercado
    
    Do login

    Create a new task            ${task}
    Should have task             ${task}

    Remove task by name          ${task}

    Wait Until Page Does Not Contain    ${task}

Deve marcar tarefa como concluída
    [Tags]    done
    ${task}        Set Variable        Estudar XPath
    
    Do login

    Create a new task            ${task}
    Should have task             ${task}

    Finish task by name          ${task}
    Task should be done          ${task}