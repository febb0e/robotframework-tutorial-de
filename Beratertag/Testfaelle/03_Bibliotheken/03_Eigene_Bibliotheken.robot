*** Settings ***
Library    library/mylib.py

*** Test Cases ***
Dieser Test nutzt die eigene Bibliothek
    Check String Length    Hello Robots    12

Dieser Test schlaegt fehl
    Check String Length    Hello Humans    11
