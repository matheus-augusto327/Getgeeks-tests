*Settings*
Documentation       Login Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Test setup          Start Session
Test Teardown       Finish Session

*Test Cases*
User Login

  ${user}                   Factory User Login
  Add User From Database    ${user}

  Go To Login Page
  Fill Credentials          ${user}
  Submit Credentials
  User Should Be Logged In  ${user}


Incorrect Pass
  [Tags]                    i_pass

  ${user}                   Create Dictionary   email=matheus@gmail.com  password=abc123

  Go To Login Page
  Fill Credentials          ${user}
  Submit Credentials
  Modal Content Should Be   Usuário e/ou senha inválidos.