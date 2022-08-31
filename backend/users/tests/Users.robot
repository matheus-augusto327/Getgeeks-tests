*Settings*
Documentation         Users route test suite

Resource              ${EXECDIR}/resources/Base.robot

*Test Cases*
Add new user
  ${user}             Factory New User

  Remove User         ${user}
 
  ${response}         POST User          ${user}
  Status Should Be    201                ${response}

  ${user_id}          Set Variable       ${response.json()}[id]
  Should Be True      ${user_id} > 0



Get user data
  ${user}             Factory Get User
  POST User           ${user}

  ${token}            Get Token          ${user}
  ${response}         GET User           ${token}
  Status Should Be    200                ${response}