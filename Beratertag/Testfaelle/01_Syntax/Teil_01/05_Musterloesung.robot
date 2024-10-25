*** Comments ***
Musterlösung zu 'Grundlagen der RobotFramework-Syntax I'

1. Gebe deinen Namen in der Konsole aus
2. Gebe die Anzahl Zeichen im Wort 'Beratertag 06.12.2024' aus
3. Prüfe zwei Werte auf Gleichheit (Wort, Zahl, Boolean etc.)

*** Settings ***
Library    String

*** Test Cases ***
Loesung 1
    Log To Console    Vorname Nachname

Loesung 2
    ${Laenge}=    Get Length    item=Beratertag 06.12.2024
    Log To Console    message=${Laenge}

Loesung 3
    Should Be Equal    first=Hallo    second=Hallo
    Should Be Equal As Integers    first=4711    second=4711
    Should Be True    condition=${False}==${False}