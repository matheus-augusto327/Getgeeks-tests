*Settings*
Documentation                BeGeek test suite

Resource                     ${EXECDIR}/resources/Base.robot

Test Setup                   Start Session
Test Teardown                Finish Session

*Test Cases*
Be a Geek

  ${user}                    Factory User Be Geek

  Do Login                   ${user}

  Go to Geek Form
  Fill Geek Form             ${user}[geek_profile]  


*Keywords*
Go To Geek Form
  Click                      css=a[href="/be-geek"] >> text=Seja um Geek

  Wait For Elements State    css=.be-geek-form  visible  5


Fill Geek Form
  [Arguments]                ${geek_profile}

  Fill Text                  id=whatsapp               ${geek_profile}[whats]
  Fill Text                  id=desc                   ${geek_profile}[desc] 

  Select Options By          id=printer_repair  text  ${geek_profile}[printer_repair]
  Select Options By          id=work            text  ${geek_profile}[work]