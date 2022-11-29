*** Settings ***
Documentation     Fichiers de scripts pour le module RQ3 : Sites.
Library    SeleniumLibrary
Variables    ../Locators/Locators.py

*** Variables ***
${TIMEOUT}    5s

*** Keywords ***
LogIn
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Saisie du login
    Input text    ${txt_UserName}    ${vUsername}
    # Saisie du mot de passe    
    Input text    ${txt_Password}    ${vPassword}
    # Click sur le bouton Connexion
    Click Button   ${btn_Login}
Verification
    ${URL_Log_In}    Get Location
    Log    URL de la page actuel
    Should Be Equal    ${URL_Log_In}    ${URL_Attendue}
    # S'assurer que la page est chargee
    Sleep    3
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Page Should Contain    Congratulations student. You successfully logged in!
    Log    le message preuve de la page de logIn
    ${Text_Deconexion}    Get Text    ${link_Deconnexion}
    log    le text de la deconexion de la page
    Should Be Equal    ${link_Deconnexion}    ${link_DeconnexionAttendue}
         
    Element Should Be Enabled    ${link_Deconnexion}



verification Negative username test
    Page Should Contain Element    ${link_ErrorMessage}
    ${Message_Erreur}    Get Text    ${link_ErrorMessage}    
    Log    messaged'erreur:
    Page Should Contain    ${Lbl_Text__Error_username}  
    Log    message  


verificationNegative password test   
    Page Should Contain Element    ${link_ErrorMessage}
    Log    message
    Page Should Contain    ${Lbl_Text__Error_password}
    Log    message

Logout
   sleep    3s
    Wait Until Element Is Visible    ${link_Deconnexion}
    Click Element    ${link_Deconnexion}
    [Teardown]    Close Browser

