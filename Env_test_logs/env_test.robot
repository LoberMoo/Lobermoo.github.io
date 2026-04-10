*** Settings ***
Library     Browser    auto_closing_level=KEEP
Variables     dotenv_loader.py

*** Test Cases ***

Fetch Variables
    Log     User: ${USER}
    Log     Pass: ${PASSWORD}
    Log     URL: ${BASE_URL}

Test Env Variables
    New Browser    chromium    headless=No
    New Page       ${BASE_URL}
    Get Title      ==    Vite App
    Type Text      [name="username"]        ${USER}    delay=0.1 s
    Type Secret    [name="password"]        $PASSWORD    delay=0.1 s
    Click With Options       input.loginform      delay=2 s
    Sleep    5s
    Get Title       ==    kotisivu
    Close Browser
