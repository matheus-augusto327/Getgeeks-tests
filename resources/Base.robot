*Settings*
Documentation   Base Test

Library         Browser
Library         factories/Users.py

Resource        Actions.robot

*Keywords*
Start Session
  New Browser   chromium    headless=false    slowMo=00:00:00.5
  New Page      https://getgeeks-matheus.herokuapp.com


Finish Session
  Take Screenshot