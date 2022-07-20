*Settings*
Documentation   Signup Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Register a new user
  ${user}             Factory User
  
  Go To Signup Form
  Fill Signup Form    ${user}
  Submit Signup Form
  User Should Be Registered


Duplicate User
  [Tags]                   dup_email

  ${user}                  Factory User
  
  Add User                 ${user}

  Go To Signup Form
  Fill Signup Form         ${user}
  Submit Signup Form
  Modal Content Should Be  Já temos um usuário com o e-mail informado.