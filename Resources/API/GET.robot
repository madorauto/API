*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  ../Common.robot

*** Keywords ***
Get Contact
  [Arguments]  ${response}
  ${json_object}=  Evaluate  json.loads($response.content)    json
  ${id}=  Get Value From Json  ${json_object}  $._id
  ${response}=  get on session  myssion  /contacts/${id[0]}
  [Return]  ${response}

Verify Get Contact
  [Arguments]  ${payload}   ${response}
  ${json_object}=  Evaluate  json.loads($response.content)    json
  Verify Status Code 200  ${response}
  Verify GET Content  ${payload}  ${json_object}

Verify GET Content
  [Arguments]  ${request}  ${response}
  GET.Verify firstName  ${request}  ${response}
  GET.Verify lastName  ${request}  ${response}
  GET.Verify email  ${request}  ${response}
  GET.Verify city  ${request}  ${response}
  GET.Verify country  ${request}  ${response}
  GET.Verify jobTitle  ${request}  ${response}
  GET.Verify company  ${request}  ${response}

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

Get Contact List
  ${response}=  get on session  myssion  /contacts
  [Return]  ${response}
Verify Get Contact List
  [Arguments]  ${response}
  Verify Status Code 200  ${response}