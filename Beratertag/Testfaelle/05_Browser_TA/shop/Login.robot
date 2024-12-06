*** Settings ***
Library    Browser
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
${ERROR_ELEMENT}     .error-message-container
${BURGER_BUTTON}     .bm-burger-button
${LOGOUT_LINK}       \#logout_sidebar_link
${LOGIN_BOX}         .login-box

*** Test Cases ***
Login mit gültigen Zugangsdaten
    [Documentation]    Überprüft, ob ein Benutzer sich mit gültigen Zugangsdaten anmelden kann.
    No Operation

Login mit ungültigen Zugangsdaten
    [Documentation]    Überprüft, ob ein Benutzer sich mit ungültigen Zugangsdaten nicht anmelden kann.
    No Operation


Validierung der Pflichtfelder im Login-Formular
    [Documentation]    Überprüft, ob die Pflichtfelder im Login-Formular korrekt validiert werden.
    No Operation


Prüfe die Sichtbarkeit und den Text der Fehlermeldungen
    [Documentation]    Überprüft, ob die Fehlermeldungen sichtbar sind und den korrekten Text enthalten.
    No Operation



Erfolgreiches Abmelden
    [Documentation]    Überprüft, ob ein Benutzer sich erfolgreich abmelden kann.
    No Operation


*** Keywords ***
Öffne Website
    [Documentation]    Öffnet den Browser und ruft die Login-Seite auf.
    New Browser    chromium    headless=False     # Browser öffnen
    Set Browser Timeout    20s                    # Timeout setzen
    New Context    viewport=None                  # Neuer Kontext
    New Page    ${BASE_URL}                       # Neue Seite mit der gegebenen URL öffnen
    Wait For Elements State    ${USERNAME_INPUT}