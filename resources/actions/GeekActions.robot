*Settings*
Documentation                Geek Actions

*Keywords*
Go To Geek Form
  Click                      css=a[href="/be-geek"] >> text=Seja um Geek

  Wait For Elements State    css=.be-geek-form  visible  5


Fill Geek Form
  [Arguments]                ${geek_profile}

  Reset Geek Form

  Fill Text                  id=whatsapp               ${geek_profile}[whats]
  Fill Text                  id=desc                   ${geek_profile}[desc] 

  Select Options By          id=printer_repair  text  ${geek_profile}[printer_repair]
  Select Options By          id=work            text  ${geek_profile}[work]

  Fill Text                  id=cost                   ${geek_profile}[cost] 


Submit Geek Form
  Click                      css=button >> text=Quero ser um Geek


Geek Form Should Be Suscess
  ${expected_message}        Set Variable  Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

  Wait For Elements State    css=p >> text=${expected_message}   visible  5


Reset Geek Form
  Execute Javascript         document.getElementsByClassName("be-geek-form")[0].reset();