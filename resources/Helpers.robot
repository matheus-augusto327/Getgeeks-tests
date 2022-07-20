*Settings*
Documentation     Test Helpers

*Keywords*
Add User
  [Arguments]     ${user}

  Go To Signup Form
  Fill Signup Form         ${user}
  Submit Signup Form
  User Should Be Registered