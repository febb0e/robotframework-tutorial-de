*** Test Cases ***
Gebe die aktuelle Zeit aus
    ${aktuelle_zeit}=    Hole aktuelle Zeit
    Log To Console    ${aktuelle_zeit} Uhr

*** Keywords ***
Hole aktuelle Zeit
    ${hour}    ${min}    ${sec}    Get Time    hour min sec    UTC + 2hours
    RETURN    ${hour}:${min}:${sec}