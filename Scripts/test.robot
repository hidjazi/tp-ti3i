*** Settings ***
Documentation    Fichiers de scripts pour le module RQ3 : Sites.
Library    SeleniumLibrary
Variables    ../Ressources/Locators/Locators.py
Resource    ../Ressources/Keywords/KeyWords.robot

*** Variables ***
${vURL}    https://practicetestautomation.com/practice-test-login/
${vBrowser}    chrome
${vUsername}    student
${vPassword}    Password123
${TIMEOUT}    5s
${vNegativeUsername}    incorrectUser
${vNegativePassword}    incorrectPassword 

*** Test Cases ***
Test case 1: Positive LogIn test
    LogIn    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    Verification 
Test case 2: Negative username test    
    LogIn    ${vURL}    ${vBrowser}    ${vNegativeUsername}    ${vPassword}
    verification Negative username test
Test case 3: Negative password test    
    LogIn    ${vURL}    ${vBrowser}    ${vUsername}    ${vNegativePassword}
    verificationNegative password test
    
































