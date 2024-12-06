*** Comments ***
Übungsaufgabe zu 'Keywords in Robotframework'

0. Führe den Testfall aus zur Validierung
1. Extrahiere die Keywords aus den Testfällen
2. Erstelle die Keywords in der Keyword-Section
    - Übergebe Arguments an die Keywords
3. Sorge dafür, dass der Testfall wie vorab funktioniert

*** Variables ***


*** Settings ***
Library    String

*** Test Cases ***
Extrahiere Keywords von mir
    VAR    ${foo}    42
    VAR    ${bar}    4711
    VAR    ${buzz}    Hello World!
    VAR    ${ergebnis}
    VAR    ${string}
    VAR    ${hex}

    # ${ergebnis}    Evaluate    ${input_1} * ${input_2}
    # Log To Console    \n${ergebnis}
    Multipliziere zwei Zahlen    ${foo}    ${bar}

    # ${string}    Catenate     SEPARATOR=__    ${input_1}    ${input_2}
    # Log To Console    ${string}
    Verbinde Strings mit Underscore    ${foo}    ${bar}

    # ${ergebnis}    Evaluate    ${input_2} - ${input_1}
    # ${hex}    Convert To Hex    ${ergebnis}
    # Log To Console    0x${hex}
    Subtrahiere zwei Zahlen und gebe Hex-Wert aus    ${bar}    ${foo}

    # ${string}    Replace String    string=${input_3}    search_for=World    replace_with=Imbus
    # Log To Console    ${string}
    Ersetze suchwort mit ersatzwort in string    suchwort=World    ersatzwort=Imbus    string=${buzz}

*** Keywords ***
Multipliziere zwei Zahlen
    [Arguments]    ${zahl_1}    ${zahl_2}
    ${ergebnis}    Evaluate    ${zahl_1} * ${zahl_2}
    Log To Console    \n${ergebnis}

Verbinde Strings mit Underscore
    [Arguments]    ${string_1}    ${string_2}
    ${ergebnis}    Catenate    SEPARATOR=__    ${string_1}    ${string_2}
    Log To Console    ${ergebnis}

Subtrahiere zwei Zahlen und gebe Hex-Wert aus
    [Arguments]    ${zahl_1}    ${zahl_2}
    ${ergebnis}    Evaluate    ${zahl_1} - ${zahl_2}
    ${hex}    Convert To Hex    ${ergebnis}
    Log To Console    0x${hex}

Ersetze ${suchwort} mit ${ersatzwort} in ${string}
    [Arguments]    ${suchwort}    ${ersatzwort}    ${string}
    ${string}    Replace String
    ...    string=${string}
    ...    search_for=${suchwort}
    ...    replace_with=${ersatzwort}
    Log To Console    ${string}