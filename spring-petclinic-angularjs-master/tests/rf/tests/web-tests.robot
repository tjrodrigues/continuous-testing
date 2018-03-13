*** Settings ***
Resource          ../resources/variables.robot
Resource          ../resources/keywords.robot

*** Test Cases ***
Get Owners
    Open Application
    List All Owners

Get Vets
    List Vets

Insert New Owner
    Insert Owner
