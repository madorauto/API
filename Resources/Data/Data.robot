*** Settings ***
Library  JSONLibrary
Library  RequestsLibrary

*** Variables ***
&{payload}  firstName=Mister  lastName=Tester  email=mistertest@test.com  location.city=Manila  location.country=Philippines  employer.jobTitle=Tester  employer.company=Test
&{payloadupdate}  firstName=Mister  lastName=Tester  email=mister2test@test.com  location.city=Venice  location.country=Italy  employer.jobTitle=Tester2  employer.company=Test2
