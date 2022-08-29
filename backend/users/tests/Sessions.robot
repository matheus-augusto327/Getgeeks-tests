*Settings*
Documentation         Session route test suite

Library               RequestsLibrary

*Variables*
${API_USERS}          https://getgeeks-users-matheus.herokuapp.com 

*Test Cases*
User session

  ${payload}          Create Dictionary      email=kate@hotmail.com  password=pwd123

  ${response}         POST                   ${API_USERS}/sessions   json=${payload}  headers=${headers}

  Status Should Be    200                    ${response}

  ${size}             Get Length             ${response.json()}[token]
  ${expected_size}    Convert To Integer     140
  
  Should Be Equal     ${expected_size}       ${size}
  Should Be Equal     10d                    ${response.json()}[expires_in]