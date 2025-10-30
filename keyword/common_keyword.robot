*** Settings ***
Resource    ../resource/resource.robot

*** Keywords ***
Open Minimal application success
    Run Keyword If      '${system}' == 'Android'
        ...    Open Application    ${APPIUM_SERVER}
        ...    platformName=Android
        ...    platformVersion=${PlatformVersion} 
        ...    deviceName=${DeviceName}
        ...    app=${AppName}
        ...    automationName=uiautomator2
        Wait Until Page Contains       Minimal

Click ${ButtonName} button
    Wait Until Element Is Visible    ${ButtonName}
    Click Element    ${ButtonName}

Clear message
    [Arguments]     ${message}
    Wait Until Element Is Visible       ${message}
    Clear Text      ${message}

Input message
    [Arguments]     ${locator}      ${message}
    Wait Until Element Is Visible   ${locator}
    Input Text      ${locator}      ${message}
