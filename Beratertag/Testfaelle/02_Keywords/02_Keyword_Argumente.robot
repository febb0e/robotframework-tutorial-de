*** Variables ***
${MY_VARIABLE}    Ich kann überall eingebunden werden in dieser Suite   # Suite Variable

*** Test Cases ***
Gebe Suite Variable aus
    Log To Console    message=${MY_VARIABLE}

Ueberreiche Parameter an Keyword
    Gebe ueberreichte Parameter aus
    ...    parameter_1=Ich wurde uebergeben
    ...    parameter_2=Ich ebenfalls

Verwende VAR syntax
    VAR    &{Dictionary}
    ...    apfel=lecker
    ...    banane=gesund
    Gebe ueberreichte Parameter aus    ${Dictionary}

Verwende inline Argumente für Parameter1 und Parameter2
    Gebe parameter_1 und parameter_2 aus


*** Keywords ***
Gebe ueberreichte Parameter aus
    [Arguments]    ${parameter_1}    ${parameter_2}=leer
    Log To Console    message=\nParameter 1: ${parameter_1}
    Log To Console    message=Parameter 2: ${parameter_2}

Gebe ${parameter_1} und ${parameter_2} aus
    Log To Console    message=\nParameter 1: ${parameter_1}
    Log To Console    message=Parameter 2: ${parameter_2}