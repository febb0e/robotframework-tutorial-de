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
    VAR    ${input_1}    42
    VAR    ${input_2}    4711
    VAR    ${input_3}    Hello World!
    
    VAR    ${ergebnis}
    VAR    ${string}
    VAR    ${hex}

    # Multipliziere zwei Zahlen
    ${ergebnis}    Evaluate    ${input_1} * ${input_2}
    Log To Console    \n${ergebnis}

    # Verbinde Strings mit Underscore
    ${string}    Catenate     SEPARATOR=__    ${input_1}    ${input_2}
    Log To Console    ${string}

    # Subtrahiere zwei Zahlen und gebe Hex-Wert aus
    ${ergebnis}    Evaluate    ${input_2} - ${input_1}
    ${hex}    Convert To Hex    ${ergebnis}
    Log To Console    0x${hex}

    # Ersetze ${suchwort} mit ${ersatzwort} in ${string}
    ${string}    Replace String    string=${input_3}    search_for=World    replace_with=Imbus
    Log To Console    ${string}

*** Keywords ***
Multipliziere zwei Zahlen
    No Operation

Verbinde Strings mit Underscore
    No Operation

Subtrahiere zwei Zahlen und gebe Hex-Wert aus
    No Operation

Ersetze ${suchwort} mit ${ersatzwort} in ${string}
    No Operation