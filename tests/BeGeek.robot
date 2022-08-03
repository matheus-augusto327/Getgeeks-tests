*Settings*
Documentation                BeGeek test suite

Resource                     ${EXECDIR}/resources/Base.robot

Test Setup                   Start Session
Test Teardown                Finish Session

*Test Cases*
Be a Geek

  ${user}                    Factory User  be_geek
  Do Login                   ${user}

  Go to Geek Form
  Fill Geek Form             ${user}[geek_profile]  
  Submit Geek Form  
  Geek Form Should Be Suscess


Short Description

  ${user}                    Factory User  short_desc
  Do Login                   ${user}

  Go To Geek Form
  Fill Geek Form             ${user}[geek_profile]  
  Submit Geek Form  
  Alert Span Should Be       A descrição deve ter no mínimo 80 caracteres


Long Description

  ${user}                    Factory User  short_desc
  Do Login                   ${user}

  Go To Geek Form
  Fill Geek Form             ${user}[geek_profile]  
  Submit Geek Form  
  Alert Span Should Be       A descrição deve ter no máximo 255 caracteres