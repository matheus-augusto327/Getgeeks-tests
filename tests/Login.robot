*Settings*
Documentation       Login Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Test setup          Start Session
Test Teardown       Finish Session

*Test Cases*
User Login
  Go To Login Page
  Fill Credentials          matheus@gmail.com   ogelogel
  Submit Credentials
  User Should Be Logged In  Matheus Augusto