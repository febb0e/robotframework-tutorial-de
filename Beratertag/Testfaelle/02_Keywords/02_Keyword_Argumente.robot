*** Comments ***
Argumente dienen der Übergabe von Daten an Keywords, zur Verwendung/Manipulation etc. innerhalb der Keywords
Folgende Arten von Argumenten werden unterschieden:
    1. Inline Argumente
        - können die fachliche Lesbarkeit erhöhen
        - Argumente sind im Titel des Keywords integriert
    2. Explizite Argumente
        - übliche Verwendung / Anlehnung an Programmiersprachen
        - Argumente werden nach dem Titel des Keywords übergeben
    3. Default Argumente
        - Werte von Argumenten, die verwendet werden, wenn das Argument ohne Wert übergeben wird
    4. Positional Argumente
        - Argumente des Keywords werden anhand ihres Index identifiziert
    5. Named Argumente
        - Argumente des Keywords werden über deren Namen identifiziert

Argumente können mit der 3-Punkt Notation übergeben werden, um die Übersichtlichkeit zu erhöhen

*** Variables ***
${MY_VARIABLE}      Ich kann überall eingebunden werden in dieser Suite    # Suite Variable


*** Test Cases ***
Gebe Suite Variable aus
    Log To Console    message=${MY_VARIABLE}        # Named Argument

Ueberreiche Parameter an Keyword
    Gebe ueberreichte Parameter aus
    ...    parameter_1=Ich wurde uebergeben
    ...    parameter_2=Ich ebenfalls

Verwende VAR syntax
    VAR    &{Dictionary}
    ...    apfel=lecker
    ...    banane=gesund
    Gebe ueberreichte Parameter aus    ${Dictionary}    # Positional Argument

Verwende inline Argumente für Parameter1 und Parameter2
    Gebe parameter_1 und parameter_2 aus                # Inline Arguments


*** Keywords ***
Gebe ueberreichte Parameter aus
    [Arguments]    ${parameter_1}    ${parameter_2}=leer
    Log To Console    message=\nParameter 1: ${parameter_1}
    Log To Console    message=Parameter 2: ${parameter_2}

Gebe ${parameter_1} und ${parameter_2} aus
    Log To Console    message=\nParameter 1: ${parameter_1}
    Log To Console    message=Parameter 2: ${parameter_2}
