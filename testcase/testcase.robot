*** Settings ***
Resource    ../resource/resource.robot

Test Teardown   Close Application

*** Test Cases ***
TC_1 Verify creation the to do list without reminder success
    [Documentation]     A user opens the Minimal app and create the to-do list without reminder
    [Tags]  TC_1
    Open Minimal application success
    Create to do list success without reminder      ${taskName} 

TC_2 Verify creation the to do list with reminder success
    [Documentation]     A user opens the Minimal app and create the to-do list with reminder
    [Tags]  TC_2
    Open Minimal application success
    Create to do list success with reminder      ${taskName} 