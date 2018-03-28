# Pay Slip
## Problem: Employee monthly pay slip

When supplied employee details: first name, last name, annual salary (positive integer) and super rate (0% - 50% inclusive), payment start date, the program should generate pay slip information with name, pay period, gross income, income tax, net income and super.

The calculation details will be the following:
- pay period = per calendar month  
- gross income = annual salary / 12 months  
- income tax = based on the tax table provided below  
- net income = gross income - income tax  
- super = gross income x super rate  

Notes: All calculation results should be rounded to the whole dollar. If >= 50 cents round up to the next dollar increment, otherwise round down.  

The following rates for 2017-18 apply from 1 July 2017:

Taxable income | Tax on this income
-------------- | ------------------
$0 - $18,200 | Nil
$18,201 - $37,000 | 19c for each $1 over $18,200
$37,001 - $87,000 | $3,572 plus 32.5c for each $1 over $37,000
$87,001 - $180,000 | $19,822 plus 37c for each $1 over $87,000
$180,001 and over | $54,232 plus 45c for each $1 over $180,000

 For example, the payment in March for an employee with an annual salary of $60,050 and a super rate of 9% is:
- pay period = Month of March (01 March to 31 March)  
- gross income = 60,050 / 12 = 5,004.16666667 (round down) = 5,004  
- income tax = (3,572 + (60,050 - 37,000) x 0.325) / 12 = 921.9375 (round up) = 922  
- net income = 5,004 - 922 = 4,082  
- super = 5,004 x 9% = 450.36 (round down) = 450

Here is the csv input and output format we provide (but feel free to use any format you want):

Input (first name, last name, annual salary, super rate (%), payment start date):
```
David,Rudd,60050,9%,01 March – 31 March
Ryan,Chen,120000,10%,01 March – 31 March
```

Output (name, pay period, gross income, income tax, net income, super):
```
David Rudd,01 March – 31 March,5004,922,4082,450
 Ryan Chen,01 March – 31 March,10000,2669,7331,1000
```
As part of your solution:
- List any assumptions that you made in order to solve this problem.  
- Provide instructions on how to run the application.
