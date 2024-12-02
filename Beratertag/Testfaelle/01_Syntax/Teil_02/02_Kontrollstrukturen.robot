*** Comments ***
Kontrollstrukturen sind hilfreich für verschiedene Anwendungsfälle:
    - Abzweigung in unterschiedliche Automatisierungsabläufe in Abhängigkeit von Bedingungen
    - Iteration über eine Liste von Werten
    - Iteration in Abhängigkeit einer Bedingung

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
    VAR    ${limit}=    100
    WHILE    ${value} < ${limit}
        ${value}=    Evaluate    ${value} + 1
    END
    Log To Console    \n${value}
