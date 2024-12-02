*** Comments ***
Hier findest du zwei Testfälle.
Ein Testfall wird erfolgreich durchlaufen, der andere wird fehlschlagen.

Es gibt mehrere Möglichkeiten die Resultate der Testfälle zu betrachten:
    1. Die Entwicklungsumgebung (VSCode) zeigt uns den Fehler an
    2. Die Debug-Konsole (unterer Bereich) zeigt uns den detaillierten Log an
        - Argumente
        - Returns
        - Fehlermeldungen
    3. Der Terminal zeigt die Robotframework Ausgaben der Testfälle an
        - Testergebnisse
        - Log-Ausgaben (bei Verwendung der Log-Befehle)
        - Fehlermeldungen
    4. Die Test Results zeigen die Ergebnisse der Testfälle an
        - Testergebnisse
        - Fehlermeldungen

*** Test Cases ***                                    # Abschnitt für alle automatisierten Testfälle
Ein Testfall der erfolgreich ist                      # Testfall Titel
    Log    message=\nHallo Imbus    console=INFO      # Automatisierungsschritt 1 (Einrückung relevant)
    Log To Console    Hallo Imbus von der Konsole     # Automatisierungsschritt 2 (Einrückung relevant)
    Should Be Equal    first=Imbus    second=Imbus    # Automatisierungsschritt 3 (Einrückung relevant)
                                                      # und so weiter...
Ein Testfall der fehlschlaegt
    Should Be Equal    first=Imbus    second=Imbus
    Should Be Equal As Integers    first=4711    second=4711
    Should Be True    1==1
    Should Contain    container=Imbus    item=bis