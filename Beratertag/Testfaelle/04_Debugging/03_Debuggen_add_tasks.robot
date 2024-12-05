*** Settings ***
Library           Browser    

*** Variables ***
${URL}         https://todomvc.com/examples/react/dist/
${TASK_1}      Meine erste Aufgabe
${TASK_2}      Meine zweite Aufgabe

*** Test Cases ***
Hinzufügen von Aufgaben
    [Documentation]   Überprüft, ob eine neue Aufgabe hinzugefügt werden kann.
    New Browser    chromium    headless=False
    New Context    tracing=true
    New Page    ${URL}
    Set Browser Timeout    10s

    # Tasks hinzufügen
    Type Text       //input[@class="new-todo"]    ${TASK_1}
    Keyboard Key    press       Enter
    Type Text       //input[@class="new-todo"]    ${TASK_2}
    Keyboard Key    press       Enter

    # Überprüfen
    Get Text        //ul[@class="todo-list"]/li[1]/div/label    ==    ${TASK_1}
    Get Text        //ul[@class="todo-list"]/li[2]/div/label    ==    ${TASK_2}

    # kurz warten
    Sleep           4s

    # Löschen
    Click                       //ul[@class="todo-list"]/li[1]/div/button[@class="destroy"]
    Wait For Elements State     //ul[@class="todo-list"]/li[1]    detached    timeout=5s
    Sleep           3s
    Close Browser   ALL



# Bemerkung:
# Open Browser    ${URL}    chromium
# [ WARN ] Open Browser is for quick experimentation and debugging only. Use New Page for production.