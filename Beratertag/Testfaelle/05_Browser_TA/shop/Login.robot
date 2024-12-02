*** Settings ***
Library    Browser   enable_presenter_mode=True    show_keyword_call_banner=True
Test Setup    Öffne Website
Test Teardown    Close Browser    ALL

*** Variables ***
${BASE_URL}            https://www.saucedemo.com/
${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce
${INVALID_USERNAME}    invalid_user
${INVALID_PASSWORD}    invalid_password

# CSS-Selektoren
${USERNAME_INPUT}    input[name="user-name"]
${PASSWORD_INPUT}    input[name="password"]
${LOGIN_BUTTON}      input[name="login-button"]
${INVENTORY_LIST}    .inventory_list
${ERROR_MESSAGE}     .error-message-container
${BURGER_BUTTON}     .bm-burger-button
${LOGOUT_LINK}       \#logout_sidebar_link
${LOGIN_BOX}         .login-box

*** Test Cases ***
Login mit gültigen Zugangsdaten
    [Documentation]    Überprüft, ob ein Benutzer sich mit gültigen Zugangsdaten anmelden kann.
    Type Text    ${USERNAME_INPUT}      ${VALID_USERNAME}
    Type Text    ${PASSWORD_INPUT}         ${VALID_PASSWORD}
    Click        ${LOGIN_BUTTON}

    # Überprüfung: Login erfolgreich
    Wait For Elements State    ${INVENTORY_LIST}    visible

Login mit ungültigen Zugangsdaten
    [Documentation]    Überprüft, ob ein Benutzer sich mit ungültigen Zugangsdaten nicht anmelden kann.
    Type Text    ${USERNAME_INPUT}    ${INVALID_USERNAME}
    Type Text    ${PASSWORD_INPUT}      ${INVALID_PASSWORD}
    Click        ${LOGIN_BUTTON}

    # Überprüfung: Fehlermeldung sichtbar
    Wait For Elements State    ${ERROR_MESSAGE}     visible

Validierung der Pflichtfelder im Login-Formular
    [Documentation]    Überprüft, ob die Pflichtfelder im Login-Formular korrekt validiert werden.
    Click    ${LOGIN_BUTTON}

    # Überprüfung: Fehlermeldung für leere Felder sichtbar
    Wait For Elements State    ${ERROR_MESSAGE}     visible
    ${error_message}    Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username is required


Prüfe die Sichtbarkeit und den Text der Fehlermeldungen
    [Documentation]    Überprüft, ob die Fehlermeldungen sichtbar sind und den korrekten Text enthalten.
    Type Text    ${PASSWORD_INPUT}     ${VALID_PASSWORD}
    Click        ${LOGIN_BUTTON}

    # Überprüfung: Fehlermeldung sichtbar und Text korrekt
    Wait For Elements State    ${ERROR_MESSAGE}     visible
    ${error_message}    Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username is required

    # Nur Benutzername eingeben
    Type Text    ${USERNAME_INPUT}    ${VALID_USERNAME}
    Clear Text   ${PASSWORD_INPUT}
    Click        ${LOGIN_BUTTON}

    # Überprüfung: Fehlermeldung sichtbar und Text korrekt
    Wait For Elements State    ${ERROR_MESSAGE}     visible
    ${error_message}    Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${error_message}    Epic sadface: Password is required



Erfolgreiches Abmelden
    [Documentation]    Überprüft, ob ein Benutzer sich erfolgreich abmelden kann.
    Type Text    ${USERNAME_INPUT}    ${VALID_USERNAME}
    Type Text    ${PASSWORD_INPUT}      ${VALID_PASSWORD}
    Click        ${LOGIN_BUTTON}

    Wait For Elements State    ${INVENTORY_LIST}    visible

    # Abmelden
    Click    ${BURGER_BUTTON}
    Click    ${LOGOUT_LINK}

    # Überprüfung: Abmeldung erfolgreich
    Wait For Elements State    ${LOGIN_BOX}    visible


*** Keywords ***
Öffne Website
    [Documentation]    Öffnet den Browser und ruft die Login-Seite auf.
    New Browser    chromium    headless=False     # Browser öffnen
    Set Browser Timeout    20s                    # Timeout setzen
    New Context    viewport=None                  # Neuer Kontext
    New Page    ${BASE_URL}                       # Neue Seite mit der gegebenen URL öffnen
    Wait For Elements State    ${USERNAME_INPUT}