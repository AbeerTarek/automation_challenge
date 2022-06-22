# automation_challenge

## Automated tests for facebook registration and login scenarios:

Deliverables:
1. Use adata-driven frame work
2. A short explanation of the provided solution

### My Approach:
- test cases are in LoginTest & RegistrationTest files 
- I collected all the locators for each of the Login page and registration page in separate files
- I created two resource files to create all the needed keywords using the locator file
- I called the created keywords in the test cases 
- I created a variables in the test cases files to hold the elements values
- I called this variables in each test case
- I used the assertions to make sure that my test cases are passed

### How to setup:

`pip3 install -r automation_challenge/requirments.txt`

`export PATH=$PATH:$(pwd)/automation_challenge/BrowserDrivers`

`robot TestCases/RegistrationTest.robot`

`robot TestCases/LoginTest.robot`   
