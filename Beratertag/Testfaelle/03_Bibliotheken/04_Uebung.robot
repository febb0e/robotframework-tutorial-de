*** Comments ***
Übungsaufgabe zu 'Bibliotheken und ihre Verwendung'

    - Erweitere die Datengetriebenen Testfälle um eine Division
        1. Passe den 'sheet_name' vom Datadriver entsprechend an
        2. Füge die Argumente dem Test Case hinzu
        3. Erstelle das Keyword, sodass die Division datengetrieben funktioniert
        4. Gebe das Ergebnis von jedem Durchlauf in der Konsole aus

*** Settings ***
Library    DataDriver    file=${CURDIR}/xlsx/testcases.xlsx    sheet_name=?
Test Template    Dividiere zwei Zahlen

*** Test Cases ***
Division
...    ?
...    ?

*** Keywords ***
Dividiere zwei Zahlen
    [Arguments]    ${?}    ${?}
    No Operation