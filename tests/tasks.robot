*** Settings ***
Documentation           Task registration test suite

Resource                ${EXECDIR}/resources/base.resource

Test Setup              Start session
Test Teardown           Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa

    ${task}        Set Variable        Estudar testes com Appium e Robot
    Do login

    Create a new task            ${task}
    Should have task             ${task}

    Remove task from database    ${task}