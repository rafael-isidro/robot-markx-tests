*** Settings ***
Documentation           Task registration test suite

Resource                ${EXECDIR}/resources/base.resource

Test Setup              Start session
Test Teardown           Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa

    Do login

    ${task}        Set Variable        Estudar testes com appium e robot

    Create a new task        ${task}
    Should have task         ${task}