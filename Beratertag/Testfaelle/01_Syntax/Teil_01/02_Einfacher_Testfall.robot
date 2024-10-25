*** Test Cases ***
Ein Testfall der erfolgreich ist
    Log    message=Hallo Imbus    console=INFO
    Log To Console    Hallo Imbus von der Konsole
    Should Be Equal    first=Imbus    second=Imbus

Ein Testfall der fehlschlaegt
    Should Be Equal    first=Imbus    second=Imbus
    Should Be Equal As Integers    first=4711    second=4711
    Should Be True    1==1
    Should Contain    container=Imbus    item=bis