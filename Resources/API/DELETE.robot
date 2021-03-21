*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  ../Common.robot

*** Keywords ***

Delete Contact
  [Arguments]  ${response}
  ${json_object}=  Evaluate  json.loads($response.content)    json
  ${id}=  Get Value From Json  ${json_object}  $._id
  ${response}=  delete on session  myssion  /contacts/${id[0]}
  [Return]  ${response}


Verify Delete Contact
  [Arguments]  ${response}
  Verify Status Code 204  ${response}
