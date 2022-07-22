*Settings*
Documentation   Signup Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Register a new user
  ${user}             Factory User
  
  Go To Signup Form
  Fill Signup Form         ${user}
  Submit Signup Form
  User Should Be Registered


Duplicate User
  [Tags]                   attempt_signup

  ${user}                  Factory User
  
  Add User From Database   ${user}

  Go To Signup Form
  Fill Signup Form         ${user}
  Submit Signup Form
  Modal Content Should Be  Já temos um usuário com o e-mail informado.


Wrong Email
  [Tags]                   attempt_signup

  ${user}                  Factory Wrong Email

  Go To Signup Form
  Fill Signup Form         ${user}
  Submit Signup Form
  Alert Span Should Be     O email está estranho


Required Fields
  [Tags]                   attempt_signup   reqf

  Go To Signup Form
  Submit Signup Form
  Alert Span Should Be     Cadê o seu nome?
  Alert Span Should Be     E o sobrenome?
  Alert Span Should Be     O email é importante também!
  Alert Span Should Be     Agora só falta a senha!


Short Password
  [Tags]                   attempt_signup   short_pass
  [Template]               Signup With Short Pass
  1
  12
  123
  1234
  12345
  a
  a2
  ab3
  ab3c
  a23bc
  -1
  acb#1
    

*Keywords*
Signup With Short Pass
  [Arguments]               ${short_pass}

  ${user}                   Create Dictionary
  ...                       name=Matheus              lastname=Augusto
  ...                       email=matheus@gmail.com   password=12345     

  Go To Signup Form
  Fill Signup Form          ${user}
  Submit Signup Form
  Alert Span Should Be      Informe uma senha com pelo menos 6 caracteres 