*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/Data/Data.robot
Documentation  DELETE
Test Setup  Start Test

*** Test Cases ***
Add Contact
  #pre-requisite
  ${addresponse}  POST.Add Contact  ${payload}
  POST.Verify Add Contact Response  ${payload}  ${addresponse}
  #request
  ${deleteresponse}  DELETE.Delete Contact  ${addresponse}
  #response
  DELETE.Verify Delete Contact  ${deleteresponse}