*** Comments ***
Überblick über Externe Bibliotheken
Importieren und Nutzen von Externen Bibliotheken
    - DataDriver Library (https://github.com/Snooz82/robotframework-datadriver)

https://robotframework.org/?tab=libraries#resources

*** Settings ***
Library    DataDriver    file={CURDIR}/xlsx/testcases.xlsx
Test Template    Multipliziere zwei Zahlen

*** Test Cases ***
Pruefe Multiplikation

*** Keywords ***
Multipliziere zwei Zahlen
    [Arguments]    ${argument_1}    ${argument_2}
    ${ergebnis}    Evaluate    ${argument_1} * ${argument_2}
    Log To Console    ${ergebnis}
