*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  ../Common.robot

*** Keywords ***

Add Contact
  [Arguments]  ${payload}
  ${response}=  post on session  myssion  /contacts  data=${payload}
  [Return]  ${response}

Verify Add Contact Response
  [Arguments]  ${payload}   ${response}
  ${json_object}=  Evaluate  json.loads($response.content)    json
  Verify Status Code 200  ${response}
  Verify POST Content  ${payload}  ${json_object}

Verify POST Content
  [Arguments]  ${request}  ${response}
  POST.Verify firstName  ${request}  ${response}
  POST.Verify lastName  ${request}  ${response}
  POST.Verify email  ${request}  ${response}
  POST.Verify city  ${request}  ${response}
  POST.Verify country  ${request}  ${response}
  POST.Verify jobTitle  ${request}  ${response}
  POST.Verify company  ${request}  ${response}

Verify firstName
  [Arguments]  ${request}  ${response}
  Should Be Equal   ${request['firstName']}  ${response['firstName']}

Verify lastName
  [Arguments]  ${request}  ${response}
  Should Be Equal  ${request['lastName']}  ${response['lastName']}

Verify email
  [Arguments]  ${request}  ${response}
  Should Be Equal  ${request['email']}  ${response['email']}

Verify city
  [Arguments]  ${request}  ${response}
  ${cityresponse}=  Get Value From Json  ${response}  $.location.city
  Should Be Equal  ${request['location.city']}  ${cityresponse[0]}

Verify country
  [Arguments]  ${request}  ${response}
  ${countryresponse}=  Get Value From Json  ${response}  $.location.country
  Should Be Equal  ${request['location.country']}  ${countryresponse[0]}

Verify jobTitle
  [Arguments]  ${request}  ${response}
  ${jobTitleresponse}=  Get Value From Json  ${response}  $.employer.jobTitle
  Should Be Equal  ${request['employer.jobTitle']}  ${jobTitleresponse[0]}

Verify company
  [Arguments]  ${request}  ${response}
  ${companyresponse}=  Get Value From Json  ${response}  $.employer.company
  Should Be Equal  ${request['employer.company']}   ${companyresponse[0]}



