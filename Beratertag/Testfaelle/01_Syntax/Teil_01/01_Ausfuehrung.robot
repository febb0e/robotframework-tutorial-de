*** Comments ***
Für die Ausführung von Robotframework Dateien gibt es 2 Möglichkeiten
    1. Starten über RobotCode in VSCode
        - Testdatei '01_Ausfuehrung.robot' öffnen
        - Pfeil neben Testfall klicken
        - ODER: Pfeil in Tableiste klicken (Run Current File)
    2. Ausführung über Konsole (CLI)
        - Terminal öffnen
        - relativen Dateipfad der auszuführenden Testdatei wissen
        - Kommando: robot /relativer/pfad/zu/01_Ausfuehrung.robot
        - Es gibt viele Konfigurationen für die Ausführung:
            - siehe: robot --help

*** Test Cases ***
Ich moechte ausgefuehrt werden
    Log To Console    message=Ausfuehrung erfolgreich!