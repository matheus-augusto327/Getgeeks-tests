*Settings*
Documentation       Login Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Test setup          Start Session
Test Teardown       Finish Session

*Test Cases*
User Login

  ${user}                   Factory User  login

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


User Not Found
  [Tags]                    user_404

  ${user}                   Create Dictionary   email=matheus@404.net  password=abc123

  Go To Login Page
  Fill Credentials          ${user}
  Submit Credentials
  Modal Content Should Be   Usuário e/ou senha inválidos.


Incorrect Email
  [Tags]                    i_email

  ${user}                   Create Dictionary   email=matheus@404.net    password=abc123

  Go To Login Page
  Fill Credentials          ${user}
  Submit Credentials
  Should Be Type Email


Required Email

  ${user}                   Create Dictionary   email=${EMPTY}           password=abc123

  Go To Login Page
  Fill Credentials          ${user} 
  Submit Credentials
  Alert Span Should Be      E-mail obrigatório


Required Pass

  ${user}                   Create Dictionary   email=matheus@gmail.com  password=${EMPTY} 

  Go To Login Page
  Fill Credentials          ${user} 
  Submit Credentials
  Alert Span Should Be      Senha obrigatória


Required Fields

  @{expected_alerts}        Create List
  ...                       E-mail obrigatório
  ...                       Senha obrigatória

  Go To Login Page
  Submit Credentials
  Alert Spans Should Be     ${expected_alerts}