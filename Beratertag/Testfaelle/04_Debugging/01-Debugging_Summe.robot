*** Comments ***
Beschreibung: Testet die Addition von zwei Zahlen, enthält einen Fehler für Debugging-Übungen.
1.Führe den Testfall aus und behebe den Fehler.

*** Variables ***
${NUM1}    5
${NUM2}    3
${EXPECTED_SUM}    5+3

*** Test Cases ***
Test Addition With Error
    [Documentation]    Testet die Addition von zwei Zahlen, enthält einen Fehler für Debugging-Übungen.
    ${result}=    Evaluate    ${NUM1} + ${NUM2}
    ${EXPECTED_SUM}=   Evaluate    ${NUM1} + 4
    Log    Berechnetes Ergebnis: ${result}
    Should Be Equal    ${result}    ${EXPECTED_SUM}    Die Summe ist nicht wie erwartet!
