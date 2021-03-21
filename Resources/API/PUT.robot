*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  ../Common.robot

*** Keywords ***

Update Contact
  [Arguments]  ${payloadupdate}  ${response}
  ${json_object}=  Evaluate  json.loads($response.content)    json
  ${id}=  Get Value From Json  ${json_object}  $._id
  ${response}=  put on session  myssion  /contacts/${id[0]}  data=${payloadupdate}
  [Return]  ${response}

Verify Update Contact Response
  [Arguments]   ${response}
  Verify Status Code 204  ${response}
