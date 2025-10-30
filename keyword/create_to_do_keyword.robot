*** Settings ***
Resource    ../resource/resource.robot

*** Keywords ***
Create to do list
    [Arguments]     ${title}
    Click ${createToDoList} button
    Wait Until Element Is Visible   ${createTitleToDoList}
    Input message      ${createTitleToDoList}     ${title}

Create to do list success without reminder
    [Arguments]     ${titleTodoList}
    Create to do list       ${titleTodoList}
    Click ${saveToDoList} button
    Wait Until Page Contains       Minimal
    Wait Until Element Is Visible       ${toDoListItemTextview}
    Element Text Should Be      ${toDoListItemTextview}      ${titleTodoList}

Create to do list success with reminder
    [Arguments]     ${titleTodoList}
    Create to do list       ${titleTodoList}
    Click ${toggleRemindMe} button
    Click ${saveToDoList} button
    Wait Until Page Contains       Minimal
    Wait Until Element Is Visible       ${toDoListItemTextview}
    Element Text Should Be      ${toDoListItemTextview}      ${titleTodoList}
    Element Should Be Visible      ${toDoListItemTimeTextview}