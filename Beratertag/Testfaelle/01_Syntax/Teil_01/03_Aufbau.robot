*** Comments ***
Wir zeigen Euch, welche Bereiche es in einer Robotframework Suite gibt.

    1. Comments
        - Allgemeine Kommentare zur Erläuterung der Suite
    2. Settings
        - Einstellungen der Test-Suite über:
            - Einbindung von benötigten Bibliotheken
            - Testaufbau und -abbau Bedingungen
            - Timeouts und andere Konfigurationen
    3. Variables
        - Auflistung von suite-relevanten Variablen
    4. Test-Cases
        - Automatisierte Testfälle
        - Freiwählbare Namen
    5. Keywords
        - wiederverwendbare Funktionen
        - Freiwählbare Namen


*** Settings ***
Documentation       Hier kann dokumentiert werden

Library             String
# Resource    /pfad/zu/meiner/library.py


*** Variables ***
${MY_MESSAGE}=       Liebe Gruesse vom Keyword :p


*** Test Cases ***
Ich bin ein Testfall
    [Documentation]    Hier dokumentiert man einen Testfall
    [Tags]    tag1    tag2
    [Timeout]    10 s
    [Setup]    Log To Console    \nDas ist der Anfang
    # Benutzerdefiniertes Keyword
    Gruesse von einem Keyword    MyArgument=Foehlicher Nikolaustag!
    [Teardown]    Log To Console    Das ist das Ende


*** Keywords ***
Gruesse von einem Keyword
    [Documentation]    Keywords können auch dokumentiert werden
    [Arguments]    ${MyArgument}
    # Built-In Keyword
    Log To Console    message=${MY_MESSAGE}
    Log To Console    message=${MyArgument}
    # Library Keyword
    ${MessageLength}    Get Length    item=${MyArgument}
    Log To Console    MyArgument ist ${MessageLength} Zeichen lang!
