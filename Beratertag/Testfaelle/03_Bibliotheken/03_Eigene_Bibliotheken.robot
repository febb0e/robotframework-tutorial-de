*** Comments ***
Eigene Bibliotheken können eingebunden werden, indem man den Pfad zur Python Datei angibt

*** Settings ***
Library    library/mylib.py

*** Test Cases ***
Dieser Test nutzt die eigene Bibliothek
    Check String Length    Hallo Imbus    11

Dieser Test schlaegt fehl
    Check String Length    Hallo Nikolaus    13
