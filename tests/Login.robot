*Settings*
Documentation       Login Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Test setup          Start Session
Test Teardown       Finish Session

*Test Cases*
User Login

  ${user}                  Factory User Login
  Add User From Database   ${user}

  Go To Login Page
  Fill Credentials          ${user}
  Submit Credentials
  User Should Be Logged In  ${user}