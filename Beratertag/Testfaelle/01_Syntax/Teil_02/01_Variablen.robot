*** Variables ***
${SKALAR}=       Skalarvariablen sind ein einzelnes Objekt
&{DICTIONARY}        vorname=Mein Vorname    nachname=Mein Nachname
@{LIST}=
...        Apfel
...        Banane
...        Heidelbeere
...        Orange
# Vordefinierte RFW-Variablen
${EMPTY}
${True}
${False}

*** Test Cases ***
Gebe die Variablen aus
    Log To Console    message=${SKALAR}
    Log To Console    message=&{DICTIONARY}
    Log To Console    message=@{LIST}

Greife auf Dictionary zu
    VAR    ${vorname}    ${DICTIONARY['vorname']}
    Log To Console    ${vorname}
    # Zugriff auf identische Variable, da nicht case-sensitiv in RFW
    Log To Console    ${VORNAME}
    VAR    ${nachname}    ${DICTIONARY['nachname']}
    Log To Console    ${nachname}

Greife auf Liste zu
    VAR    ${erstes_element}    ${LIST[0]}
    Log To Console    ${erstes_element}
    VAR    ${drittes_element}    ${LIST[2]}
    Log To Console    ${drittes_element}
    # Zugriff auf identische Variable, da nicht case-sensitiv in RFW
    Log To Console    ${DRITTES_ELEMENT}

Gebe vordefinierte Variablen aus
    Log To Console    ${EMPTY}
    Log To Console    ${None}
    Log To Console    ${EXECDIR}
    Log To Console    ${CURDIR}
