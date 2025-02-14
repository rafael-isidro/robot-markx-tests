*** Settings ***
Documentation            Minhas tarefas screen elements and actions

Library                  AppiumLibrary

*** Variables ***
${new_task_input}         xpath=//*[contains(@text, "nova tarefa")]
${add_task_button}        xpath=//*[@resource-id="createTask"]

*** Keywords ***
Create a new task

    [Arguments]            ${task_name}

    Wait Until Element Is Visible        ${new_task_input}        5

    Input Text             ${new_task_input}            ${task_name}
    Click Element          ${add_task_button}

Should have task
    [Arguments]            ${task_name}

    Wait Until Element Is Visible
    ...    xpath=//*[@resource-id="taskText"][@text="${task_name}"]
    ...    5