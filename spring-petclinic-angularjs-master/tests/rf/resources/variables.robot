*** Settings ***
Resource          ../resources/keywords.robot
Library           Collections    # Default Libraries
Library           String
Library           OperatingSystem
Library           Selenium2Library    # External Libraries
Library           Selenium2Library    # External Libraries

*** Variables ***
# Application Settings
${HOMEPAGE}       ${baseURL}
${BROWSER}        firefox
${DURATION}       30s
${RETRY}          2s
################################################ Variables ########################################################
${welcMsg}        Welcome to Petclinic
${ownersBtnChkMsg}    All
${allOwnersBtnChkMsg}    George Franklin
${ownersBtn}      xpath=//a[@href='javascript:void(0)']
${allOwnersBtn}    xpath=/html[1]/body[1]/layout-nav[1]/nav[1]/div[2]/ul[1]/li[2]/ul[1]/li[1]/a[1]
${vets}           xpath=/html[1]/body[1]/layout-nav[1]/nav[1]/div[2]/ul[1]/li[3]/a[1]/span[2]
${vetsBtnChkMsg}    James Carter
${ownRegisterBtn}    xpath=/html[1]/body[1]/layout-nav[1]/nav[1]/div[2]/ul[1]/li[2]/ul[1]/li[2]/a[1]/span[2]
${ownRegisterChkMsg}    Telephone
${firstName}      xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/ui-view[1]/owner-form[1]/form[1]/div[1]/input[1]
${lastname}       xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/ui-view[1]/owner-form[1]/form[1]/div[2]/input[1]
${address}        xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/ui-view[1]/owner-form[1]/form[1]/div[3]/input[1]
${city}           xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/ui-view[1]/owner-form[1]/form[1]/div[4]/input[1]
${telephone}      xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/ui-view[1]/owner-form[1]/form[1]/div[5]/input[1]
${submitBtn}      xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/ui-view[1]/owner-form[1]/form[1]/div[6]/button[1]
${insertedOwnChkMsg}    Robot
###############################    Selenium Settings    #################################################################
${SELENIUM.WAIT}    2s
${SELENIUM.TIMEOUT}    10 seconds
${SELENIUM.SPEED}    2s

*** Keywords ***
