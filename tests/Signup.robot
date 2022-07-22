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
  Field Notification Should Be  O email está estranho


Required Fields
  [Tags]                   attempt_signup   reqf

  Go To Signup Form
  Submit Signup
  Field Notification Should Be  Cadê o seu nome?
  Field Notification Should Be  E o sobrenome?
  Field Notification Should Be  O email é importante também!
  Field Notification Should Be  Agora só falta a senha!