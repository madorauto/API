*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/Data/Data.robot
Documentation  POST
Test Setup  Start Test


*** Test Cases ***
Get Contact
  #pre-requisite
  ${addresponse}  POST.Add Contact  ${payload}
  POST.Verify Add Contact Response  ${payload}  ${addresponse}
  #request
  ${getresponse}  GET.Get Contact  ${addresponse}
  #response
  GET.Verify Get Contact  ${payload}  ${getresponse}
  #data clean up
  End Test  ${addresponse}

Get Contact List
  #request
  ${getresponse}  GET.Get Contact List
  #response
  GET.Verify Get Contact List  ${getresponse}