*** Settings ***
Library     Browser    auto_closing_level=KEEP
Library     CryptoLibrary       variable_decryption=True


*** Variables ***
${Username}     crypt:jDXlCXP545OqqksprwFrMn7Iq3sQbo7Hs1fBk3HPEwdOSVBIzdXAoSP+RVxsL88t9X3Ku1qE/OEACOW30xvp02oOhDyofLr62w==
${Password}     crypt:WjjCJCFOmRkIhmkAg/8WvR9yzMcr/CY7dIxhtfkczwgGFGueldtddDBMst75xiU8wBasNdMoTOQ=

*** Test Cases ***
Test Env Variables
    New Browser    chromium    headless=No
    New Page       http://localhost:5173/
    Get Title      ==    Vite App
    Type Text      [name="username"]        ${Username}    delay=0.1 s
    Type Secret    [name="password"]        $Password    delay=0.1 s
    Click With Options       input.loginform      delay=2 s
    Sleep    5s
    Get Title       ==    kotisivu
    Close Browser
