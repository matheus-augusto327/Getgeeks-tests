*Settings*
Documentation   Base Test

Library         Browser
Library         factories/Users.py

Resource        Actions.robot
Resource        Database.robot
Resource        Helpers.robot

*Variables*
${BASE_URL}     https://getgeeks-matheus.herokuapp.com

*Keywords*
Start Session
  New Browser   chromium    headless=false    slowMo=00:00:00.5
  New Page      ${BASE_URL}


Finish Session
  Take Screenshot