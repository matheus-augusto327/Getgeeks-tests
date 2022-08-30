*Settings*
Documentation         Session route test suite

Resource              ${EXECDIR}/resources/Base.robot

*Test Cases*
User session

  ${payload}          Create Dictionary      email=kate@hotmail.com  password=pwd123

  ${response}         POST Session           ${payload}

  Status Should Be    200                    ${response}

  ${size}             Get Length             ${response.json()}[token]
  ${expected_size}    Convert To Integer     140

  Should Be Equal     ${expected_size}       ${size}
  Should Be Equal     10d                    ${response.json()}[expires_in]


Incorrect pass

  ${payload}          Create Dictionary      email=kate@hotmail.com  password=dfijkshhi

  ${response}         POST Session           ${payload}

  Status Should Be    401                    ${response}
  Should Be Equal     Unauthorized           ${response.json()}[error]


User not found

  ${payload}          Create Dictionary      email=kate@404.com  password=dfijkshhi

  ${response}         POST Session           ${payload}

  Status Should Be    401                    ${response}
  Should Be Equal     Unauthorized           ${response.json()}[error]


Incorrect email

  ${payload}          Create Dictionary      email=kate.com.br  password=dfijkshhi

  ${response}         POST Session           ${payload}

  Status Should Be    400                    ${response}
  Should Be Equal     Incorrect email        ${response.json()}[error]


Empty email

  ${payload}          Create Dictionary      email=${EMPTY}          password=dfijkshhi

  ${response}         POST Session           ${payload}

  Status Should Be    400                    ${response}
  Should Be Equal     Required email         ${response.json()}[error]


Without email

  ${payload}          Create Dictionary      password=dfijkshhi

  ${response}         POST Session           ${payload}

  Status Should Be    400                    ${response}
  Should Be Equal     Required email         ${response.json()}[error]


Empty pass

  ${payload}          Create Dictionary      email=kate@hotmail.com  password=${EMPTY}

  ${response}         POST Session           ${payload}

  Status Should Be    400                    ${response}
  Should Be Equal     Required pass          ${response.json()}[error]


Without email

  ${payload}          Create Dictionary      email=kate@hotmail.com

  ${response}         POST Session           ${payload}

  Status Should Be    400                    ${response}
  Should Be Equal     Required pass          ${response.json()}[error]