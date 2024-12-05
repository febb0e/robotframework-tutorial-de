*** Comments ***
Testet die Manipulation einer Liste und enthält einen absichtlichen Fehler.
1. Führe den Testfall aus und behebe die Fehler.

*** Variables ***
@{LIST}    apple    banana    cherry
${NEW_ITEM}    orange
${EXPECTED_LENGTH}    4

*** Test Cases ***
Prüfe Liste
    Logge initiale Liste
    Element zur Liste hinzufügen
    Prüfe Listenlänge
    Prüfe Listeninhalt

*** Keywords ***
Logge initiale Liste
    Log To Console    \nInitiale Liste: ${LIST}

Element zur Liste hinzufügen
    VAR    ${LIST}     @{LIST}    ${NEW_ITEM}    scope=suite
    #Log To Console    \nListe nach Hinzufügen: ${LIST}

Prüfe Listenlänge
    ${length}=    Get Length    ${LIST}
    #Log To Console    \nAktuelle Listenlänge: ${length}
    Should Be Equal    ${length}    ${EXPECTED_LENGTH}    Die Listenlänge ist nicht korrekt!

Prüfe Listeninhalt
    Should Contain    @{LIST}    ${NEW_ITEM}    Das neue Element ist nicht in der Liste!
    Should Not Contain    @{LIST}    pear    Die Liste sollte keine Birne enthalten.
