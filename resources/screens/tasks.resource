*** Settings ***
Documentation            Minhas tarefas screen elements and actions

Library                  AppiumLibrary

*** Variables ***
${new_task_input}          xpath=//*[contains(@text, "nova tarefa")]
${add_task_button}         xpath=//*[@resource-id="createTask"]

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

Remove task by name
    [Arguments]            ${task_name}

    ${confirm_button}        Set Variable          xpath=//android.widget.Button[@text="SIM"]

    Click Element          xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    Wait Until Element Is Visible    ${confirm_button}    5
    Click Element                    ${confirm_button}

Finish task by name
    [Arguments]            ${task_name}

    ${finish_task_element}    Set Variable    xpath=//*[@text="Estudar XPath"]/..

    Wait Until Element Is Visible    ${finish_task_element}    5
    Click Element    ${finish_task_element}

Task should be done
    [Arguments]            ${task_name}
    
    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView