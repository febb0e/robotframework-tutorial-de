*** Variables ***
${MyVariable}    Ich kann überall eingebunden werden in dieser Suite

*** Test Cases ***
Gebe Suite Variable aus
    Log To Console    message=${MyVariable}

Ueberreiche Parameter an Keyword
    Gebe ueberreichte Parameter aus
    ...    parameter_1=Ich wurde uebergeben
    ...    parameter_2=Ich ebenfalls

Verwende VAR syntax
    VAR    &{Dictionary}
    ...    apfel=lecker
    ...    banane=gesund
    Gebe ueberreichte Parameter aus    ${Dictionary}

*** Keywords ***
Gebe ueberreichte Parameter aus
    [Arguments]    ${parameter_1}    ${parameter_2}=leer
    Log To Console    message=Parameter 1: ${parameter_1}
    Log To Console    message=Parameter 2: ${parameter_2}