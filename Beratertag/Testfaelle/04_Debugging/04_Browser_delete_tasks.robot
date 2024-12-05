*** Settings ***
Library           Browser

*** Variables ***
${URL}            https://todomvc.com/examples/react/dist/
${TASK_NAME}      Zu löschende Aufgabe

*** Test Cases ***
Löschen der Aufgaben
    [Documentation]   Überprüft, ob eine Aufgabe gelöscht werden kann.
    New Browser    chromium    headless=False
    New Context
    New Page    ${URL}
    Set Browser Timeout    10s

    Type Text    //input[@class="new-todo"]    ${TASK_NAME}
    Press Keys    //input[@class="new-todo"]    ENTER
    Hover    //ul[@class="todo-list"]/li/div
    Click Element    //ul[@class="todo-list"]/li/div/button[@class="destroy"]
    Element Should Not Be Visible    //ul[@class="todo-list"]/li
    Close Browser