*** Settings ***
Library              Browser     enable_presenter_mode=true    show_keyword_call_banner=true
Task Setup           Öffne Website                     # wird vor jedem Testfall ausgeführt
Task Teardown        Close Browser     ALL             # wird nach jedem Testfall ausgeführt

*** Variables ***
${VALID_EMAIL}            testuser@example.com
${VALID_PASSWORD}         SecurePassword123
${URL}                    https://automationplayground.com/crm/

${SIGN_IN_BUTTON}         \#SignIn    # alternativ: a[href="login.html"]
${SIGN_OUT_BUTTON}        .nav-link
${EMAIL_INPUT}            input[name="email-name"]
${PASSWORD_INPUT}         input[id="password"]
${REMEMBER_ME_CHECKBOX}   [id='remember']
${SUBMIT_BUTTON}          button[type="submit"]
${H2_ELEMENT}             h2 >> "Our Happy Customers"    # Element mit dem Text 'Our Happy Customers' für die Validierung des Logins

*** Test Cases ***
Login Mit Gültigen Zugangsdaten
    [documentation]    Überprüft, ob ein Benutzer sich mit gültigen Zugangsdaten anmelden kann.
    [Tags]    Authentifizierung    AUT_1


    # Sign-In-Button klicken
    Click    ${SIGN_IN_BUTTON}

    # Überprüfen des Titels
    Get Element By Role    heading    name=Login

    # Gültige Zugangsdaten eingeben
    Type Text          ${EMAIL_INPUT}    ${VALID_EMAIL}
    Type Secret        ${PASSWORD_INPUT}    $VALID_PASSWORD

    # Remember-Me-Checkbox klicken
    Click    ${REMEMBER_ME_CHECKBOX}

    # Submit-Button klicken
    Click    ${SUBMIT_BUTTON}
    Sleep    5s

    # Validierung des Login-Erfolgs
    Get Element States    ${H2_ELEMENT}     contains    visible

Login Mit Leeren Feldern
    [Documentation]    Überprüft, ob ein Benutzer sich mit leeren Feldern nicht anmelden kann.
    [Tags]    Authentifizierung    NegativeTest
    # Sign-In-Button klicken
    Click    ${SIGN_IN_BUTTON}

    # Überprüfen des Titels
    Get Element By Role    heading    name=Login

    # Felder leer lassen und Submit-Button klicken
    Click    ${SUBMIT_BUTTON}

    # Überprüfung, ob die Felder als required markiert sind, da keine Möglichkeit besteht, den Tooltiptewxt zu überprüfen
    ${is_required}    Get Attribute    ${EMAIL_INPUT}    required
    Should Not Be Equal    ${is_required}    None    # Wenn required gesetzt ist, gibt Get Attribute '' zurück (nicht None).
    ${is_required}    Get Attribute    ${PASSWORD_INPUT}    required
    Should Not Be Equal    ${is_required}    None


Login Mit Ungültigen Zugangsdaten
    [Documentation]    Überprüft, ob ein Benutzer sich mit ungültigen Zugangsdaten nicht anmelden kann.
    ...    In dieser Demo kannst du beliebige Passwörter benutzen. Wir prüfen deshalb nur die E-Mail-Adresse.
    [Tags]    Authentifizierung    NegativeTest
   # Sign-In-Button klicken
    Click    ${SIGN_IN_BUTTON}

    # Überprüfen des Titels
    Get Element By Role    heading    name=Login

    # E-Mail-Adresse mit falschem Format eingeben
    Type Text    ${EMAIL_INPUT}    invalid_userexample.com
    Type Secret    ${PASSWORD_INPUT}    $VALID_PASSWORD

    # Submit-Button klicken
    Click    ${SUBMIT_BUTTON}

    # Validierung des Login-Fehlschlags
    ${email-type}    Get Attribute    ${EMAIL_INPUT}    type
    Should Be Equal    ${email-type}    email

Logout-Funktion
    [Documentation]    Überprüft, ob ein Benutzer sich abmelden kann.
    [Tags]    Authentifizierung
    # Sign-In-Button klicken
    Click    ${SIGN_IN_BUTTON}

    # Überprüfen des Titels
    Get Element By Role    heading    name=Login

    # Gültige Zugangsdaten eingeben
    Type Text    ${EMAIL_INPUT}    ${VALID_EMAIL}
    Type Secret    ${PASSWORD_INPUT}    $VALID_PASSWORD

    # Submit-Button klicken
    Click    ${SUBMIT_BUTTON}
    Sleep    5s

    # Logout-Button klicken
    Click    ${SIGN_OUT_BUTTON}
    Sleep    5s

    # Validierung des Logout-Erfolgs
    Get Element By Role    heading    name=Signed Out

*** Keywords ***
Öffne Website
    [Documentation]    Öffnet den Browser und ruft die Login-Seite auf.
    New Browser    chromium    headless=False     # Browser öffnen
    Set Browser Timeout    10s                    # Timeout setzen
    New Context      viewport=None    tracing=True      tracing=${OUTPUT_DIR}/trace.zip          # Neuer Kontext
    New Page    ${URL}                            # Neue Seite mit der gegebenen URL öffnen

