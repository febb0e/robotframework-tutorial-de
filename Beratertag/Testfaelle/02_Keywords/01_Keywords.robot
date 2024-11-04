*** Test Cases ***
Ein Test mit Keywords
    Sage Hallo
    Gruesse eine Person    Pekka

Teste Sleep 5 Sekunden
    ${Zeit}    Gebe aktuelle Zeit zurueck
    Log To Console    ${Zeit}
    Sleep    5 sec
    ${Zeit}    Gebe aktuelle Zeit zurueck
    Log To Console    ${Zeit}


*** Keywords ***
Sage Hallo
    Log To Console    \nHallo Imbus

Gruesse eine Person
    [Arguments]    ${name}
    Log To Console    \nHallo, ${name}

Gebe aktuelle Zeit zurueck
    ${hour}    ${min}    ${sec}    Get Time    hour min sec    UTC + 2hours
    RETURN    ${hour}:${min}:${sec}