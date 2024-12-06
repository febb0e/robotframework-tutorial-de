*** Comments ***
Variablen in Robotframework dienen der Speicherung von Werten.
Es gibt verschiedene Typen von Variablen (vereinfacht):
    1. Skalar:                   Platz für bis zu einem Wert
    2. Dictionary:               Schlüssel-Wert Paare (key-value pairs)
    3. List:                     beliebige Anzahl von Werten, die über ihren Index (0 - n) identifiziert werden
    4. Vordefinierte Variablen:  Durch Robotframework festgelegte Variablen mit eindeutigen Werten

Robotframework ist case-insensitive beim Zugriff auf Variablen.

Variablen können verschiedene Arten von Werten beinhalten (vereinfacht):
    1. Zahlen
    2. Buchstaben / Worte
    3. Steuerzeichen

VAR-Syntax in Robotframework dient der Vereinheitlichung bei der Deklaration von Variablen in Testcases und Keywords
    VAR    ${VARIABLE}=    zugewiesener Wert

3-Punkt Notation in Robotframework für Zeilenumbrüche in Dokumentation, Variables usw.

*** Variables ***
${SKALAR}=           Skalarvariablen sind ein einzelnes Objekt
&{DICTIONARY}
...    vorname=Mein Vorname
...    nachname=Mein Nachname
@{LIST}=
...    Apfel
...    Banane
...    Heidelbeere
...    Orange
# Vordefinierte RFW-Variablen
${EMPTY}
${True}
${False}

*** Settings ***
Library    Collections

*** Test Cases ***
Gebe die Variablen aus
    Log To Console    message=\n${SKALAR}
    Log To Console    message=&{DICTIONARY}
    Log To Console    message=@{LIST}

Greife auf Dictionary zu
    VAR    ${vorname}    ${DICTIONARY['vorname']}
    Log To Console    \n${vorname}
    # Zugriff auf identische Variable, da nicht case-sensitiv in RFW
    Log To Console    ${VORNAME}
    VAR    ${nachname}    ${DICTIONARY['nachname']}
    Log To Console    ${nachname}

Greife auf Liste zu
    VAR    ${erstes_element}    ${LIST[0]}
    Log To Console    \n${erstes_element}
    VAR    ${drittes_element}    ${LIST[2]}
    Append To List    ${LIST}    Banane
    VAR    ${LIST}    @{LIST}    Karotte
    Log To Console    ${LIST}
    Log To Console    ${drittes_element}
    # Zugriff auf identische Variable, da nicht case-sensitiv in RFW
    Log To Console    ${DRITTES_ELEMENT}

Gebe vordefinierte Variablen aus
    Log To Console    \n${EMPTY}
    Log To Console    ${None}
    Log To Console    ${EXECDIR}
    Log To Console    ${CURDIR}
