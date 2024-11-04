*** Comments ***
Hier können sinnvolle Kommentare zur Test Suite stehen

*** Settings ***
Documentation    Hier kann dokumentiert werden

Library     String
# Resource    /pfad/zu/meiner/library.py

*** Variables ***
${MyMessage}=    Liebe Gruesse vom Keyword :p

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
    Log To Console   message=${MyMessage}
    Log To Console    message=${MyArgument}
    # Library Keyword
    ${MessageLength}    Get Length    item=${MyArgument}
    Log To Console    MyArgument ist ${MessageLength} Zeichen lang!