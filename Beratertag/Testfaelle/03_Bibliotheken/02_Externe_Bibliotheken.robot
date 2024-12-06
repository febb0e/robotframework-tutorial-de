*** Comments ***
Überblick über Externe Bibliotheken
Importieren und Nutzen von Externen Bibliotheken
    - DataDriver Library (https://github.com/Snooz82/robotframework-datadriver)

https://robotframework.org/?tab=libraries#resources

Externe Bibliotheken müssen explizit installiert werden:
    Bspw. über 'pip install robotframework'

*** Settings ***
Library    DataDriver    file=${CURDIR}/xlsx/testcases.xlsx    sheet_name=Multiplikation
Test Template    Multipliziere zwei Zahlen

*** Test Cases ***
Pruefe Multiplikation
...    argument_1
...    argument_2
...    erwartungswert

*** Keywords ***
Multipliziere zwei Zahlen
    [Arguments]    ${argument_1}    ${argument_2}    ${erwartungswert}
    ${ergebnis}    Evaluate    ${argument_1} * ${argument_2}
    Should Be Equal As Strings    ${ergebnis}    ${erwartungswert}