*** Comments ***
Musterloesung zu 'Grundlagen der RobotFramework-Syntax II'

1. Greife auf das 2. Element des Dictionaries zu und gebe es aus
2. Greife auf das 3. Element der Liste zu und gebe es aus
3. Gebe jedes Element der Liste in einer FOR-Schleife aus
4. Gebe jedes Element der Liste nur dann aus, wenn es Imbus entspricht
    Tipp: FOR-Schleife und IF-Schleife kombinieren

*** Variables ***
&{dictionary}
...    element_1=Kartoffeln
...    element_2=Bio-Eier
...    element_3=Kaffeebohnen

@{list}
...    Imbus
...    Beratertag
...    Nikolaus
...    2024

*** Test Cases ***
Loesung 1
    VAR    ${zweites_element}    ${dictionary['element_2']}
    Log To Console    \n${zweites_element}

Loesung 2
    VAR    ${drittes_element}    ${list[2]}
    Log To Console    \n${drittes_element}

Loesung 3
    FOR  ${element}  IN  @{list}
        Log To Console    ${element}
    END

Loesung 4
    FOR  ${element}  IN  @{list}
        IF     '${element}' == 'Imbus'
            Log To Console    \n${element}
        END
    END