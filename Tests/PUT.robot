*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/Data/Data.robot
Documentation  PUT
Test Setup  Start Test
Test Teardown  End Test  ${addresponse}

*** Test Cases ***
Update Contact
  #pre-requisite
  ${addresponse}  POST.Add Contact  ${payload}
  POST.Verify Add Contact Response  ${payload}  ${addresponse}
  #request
  ${updateresponse}  PUT.Update Contact  ${payloadupdate}  ${addresponse}
  #response
  PUT.Verify Update Contact Response  ${updateresponse}
  #verify
  ${getresponse}  GET.Get Contact  ${addresponse}
  GET.Verify Get Contact  ${payloadupdate}  ${getresponse}