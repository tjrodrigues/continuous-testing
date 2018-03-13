*** Settings ***
Resource          ../resources/variables.robot

*** Variables ***

*** Keywords ***
Set Selenium Settings
    Set Selenium Implicit Wait    ${SE LENIUM.WAIT}
    Set Selenium Timeout    ${SELENIUM.TIMEOUT}
    #Set Selenium Speed    ${SELENIUM.SPEED}

Open Application
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Wait Until Page Contains    ${welcMsg}
    #Maximize Browser Window

List All Owners
    Click Element    ${ownersBtn}
    Wait Until Page Contains    ${ownersBtnChkMsg}
    Click Element    ${allOwnersBtn}
    Wait Until Page Contains    ${allOwnersBtnChkMsg}

List Vets
    Click Element    ${vets}
    Wait Until Page Contains    ${vetsBtnChkMsg}

Insert Owner
    Click Element    ${ownersBtn}
    Wait Until Page Contains    ${ownersBtnChkMsg}
    Click Element    ${ownRegisterBtn}
    Wait Until Page Contains    ${ownRegisterChkMsg}
    Input Text    ${firstName}    Robot
    Input Text    ${lastname}    Framework
    Input Text    ${address}    Address
    Input Text    ${city}    Coimbra
    Input Text    ${telephone}    123123123
    Click Button    ${submitBtn}
    Wait Until Page Contains    ${insertedOwnChkMsg}
	Close Browser
	
