*** Comments ***
Übungsaufgabe zu 'Keywords in Robotframework'

1. Extrahiere min. 3 Keywords aus dem vorhandenen Testfall
2. Erstelle die Keywords in der Keyword-Section
3. Sorge dafür, dass der Testfall wie vorab funktioniert

*** Variables ***
${input_1}    42
${input_2}    4711
${input_3}    Hello World!

*** Settings ***
Library    String

*** Test Cases ***
Extrahiere Keywords von mir
    VAR    ${ergebnis}
    VAR    ${string}
    VAR    ${hex}

    ${ergebnis}    Evaluate    ${input_1} * ${input_2}
    Log To Console    \n${ergebnis}
    ${string}    Catenate     SEPARATOR=__    ${input_1}    ${input_2}
    Log To Console    ${string}
    ${ergebnis}    Evaluate    ${input_2} - ${input_1}
    ${hex}    Convert To Hex    ${ergebnis}
    Log To Console    0x${hex}
    ${string}    Replace String    string=${input_3}    search_for=World    replace_with=Imbus
    Log To Console    ${string}

*** Keywords ***