*** Comments ***
Überblick über Standardbibliotheken
    - BuiltIn
    - DateTime
    - Libdoc
    - OperatingSystem
    - Screenshot

https://robotframework.org/?tab=libraries#resources

*** Variables ***
${VALUE}    101

*** Settings ***
Library    DateTime
Library    OperatingSystem

*** Test Cases ***
Gebe den Binaerwert aus
    ${result}    Convert To Binary    ${VALUE}
    Log To Console    ${result}

Gebe mir die aktuelle Zeit zurueck
    ${aktuelles_datum}    Get Current Date
    Log To Console    ${aktuelles_datum}

Erstelle eine Hello World Datei
    Create File    path=${CURDIR}/txt/helloworld.txt    content=Hello World!
    File Should Not Be Empty    path=${CURDIR}/txt/helloworld.txt

