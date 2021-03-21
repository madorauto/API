*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/Data/Data.robot
Documentation  POST
Test Setup  Start Test
Test Teardown  End Test  ${addresponse}

*** Test Cases ***
Add Contact
  #request
  ${addresponse}  POST.Add Contact  ${payload}
  #response
  POST.Verify Add Contact Response  ${payload}  ${addresponse}
  #verify
  ${getresponse}  GET.Get Contact  ${addresponse}
  GET.Verify Get Contact  ${payload}  ${getresponse}