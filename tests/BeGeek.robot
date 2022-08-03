*Settings*
Documentation                BeGeek test suite

Resource                     ${EXECDIR}/resources/Base.robot

Test Setup                   Start Session
Test Teardown                Finish Session

*Test Cases*
Be a Geek

  ${user}                    Factory User Be Geek

  Do Login                   ${user}