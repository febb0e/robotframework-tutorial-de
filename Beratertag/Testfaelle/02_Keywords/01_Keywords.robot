*** Comments ***
Keywords sind eine Gruppe von Anweisungen (Funktionen/Methoden) zur wiederholten Verwendung.
In Robotframework werden Keywords in einer eigenen Section ausgelagert.

Es gibt 3 Arten von Keywords:
    - Built-In Keywords (Vordefiniert durch Robotframework)
    - Library Keywords (Durch eingebundene/installierte Bibliotheken)
    - Selbstdefinierte Keywords

Keywords können mit und ohne Argumente verwendet werden
Keywords können Rückgabewerte haben oder nicht

*** Test Cases ***
Ein Test mit Keywords
    Sage Hallo                              # Aufruf Keyword ohne Argument
    Gruesse eine Person    # Aufruf Keyword mit Argument

Teste Sleep 5 Sekunden
    ${Zeit}    Gebe aktuelle Zeit zurueck    # Aufruf Keyword mit Rückgabewert
    Log To Console    ${Zeit}
    Sleep    5 sec
    ${Zeit}    Gebe aktuelle Zeit zurueck
    Log To Console    ${Zeit}

Gebe mehrere Werte aus
    ${a}    ${b}    Gebe mehrere Werte zurueck
    Log To Console    ${a}
    Log To Console    ${b}

*** Keywords ***
Sage Hallo                            # Selbstdefiniertes Keyword (ohne Argumente)
    Log To Console    \nHallo Imbus   # Built-In Keyword

Gruesse eine Person                   # Selbstdefiniertes Keyword (mit Argumenten)
    [Arguments]    ${name}=Pekka    ${nachname}=Klarck            # Erwartetes Argument vom Keyword
    Log To Console    \nHallo, ${name}
    Log To Console    ${nachname}

Gebe aktuelle Zeit zurueck
    ${hour}    ${min}    ${sec}    Get Time    hour min sec    UTC + 2hours
    RETURN    ${hour}:${min}:${sec}    # Rückgabewert

Gebe mehrere Werte zurueck
    VAR    ${1}    Hallo
    VAR    ${2}    Nikolaus
    RETURN    ${1}    ${2}