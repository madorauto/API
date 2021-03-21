*** Settings ***
Resource  API/POST.robot
Resource  API/DELETE.robot
Resource  API/GET.robot
Resource  API/PUT.robot
Library  JSONLibrary
Library  RequestsLibrary

*** Variables ***
${base_url}  http://3.13.86.142:3000

*** Keywords ***
Start Test
  create session  myssion  ${base_url}

End Test
  [Arguments]  ${response}
  ${json_object}=  Evaluate  json.loads($response.content)    json
  ${id}=  Get Value From Json  ${json_object}  $._id
  ${response}=  delete on session  myssion  /contacts/${id[0]}
  ${status_code}=  convert to string  ${response.status_code}
  Should Be Equal   ${status_code}  204

Verify Status Code 204
  [Arguments]  ${response}
  ${status_code}=  convert to string  ${response.status_code}
  Should Be Equal   ${status_code}  204

Verify Status Code 200
  [Arguments]  ${response}
  ${status_code}=  convert to string  ${response.status_code}
  Should Be Equal   ${status_code}  200