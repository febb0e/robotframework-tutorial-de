*** Test Cases ***
IF Bedingung
    IF     '${True}' == '${True}'
        Log To Console    message=\nIch werde ausgeführt!
    END
    IF     '${False}' == '${True}'
        Log To Console    message=Ich werde nicht ausgeführt!
    END

FOR Schleife
    VAR     @{items}
    ...    Apfel
    ...    Banane
    ...    Orange
    FOR  ${item}  IN  @{items}
            Log To Console    message=${item}
    END

WHILE Schleife
    VAR    ${value}=    1
    ${limit}=    Hole aktuelle Sekunde
    WHILE    ${value} < ${limit}
        ${value}=    Zaehle hoch    ${value}
    END
    Log To Console    \n${value}

*** Keywords ***
Hole aktuelle Sekunde
    ${sec}    Get Time    sec    UTC + 2hours
    RETURN    ${sec}

Zaehle hoch
    [Arguments]    ${value}
    ${new_value}    Evaluate    ${value} + 1
    RETURN    ${new_value}