# Bank Tech Test

[![Maintainability](https://api.codeclimate.com/v1/badges/b7260acc0ae123d2e76b/maintainability)](https://codeclimate.com/github/darciew/bank_tech_test/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/b7260acc0ae123d2e76b/test_coverage)](https://codeclimate.com/github/darciew/bank_tech_test/test_coverage) [![Build Status](https://travis-ci.org/darciew/bank_tech_test.svg?branch=master)](https://travis-ci.org/darciew/bank_tech_test)

## Technologies
Ruby

RSpec

## Task
Build a Bank Account Simulator in Ruby that can be run on the command line.

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

```
As a User
So that I can keep track of my funds
I can open a bank account

As a User
So that I can spend all my money
I can withdraw funds from my account

As a User
So that I can save some money
I can deposit funds into my account

As a User
So that I can keep track of my spending
I can view my account statement
```

## Instructions

Close this repository:
```
$ git clone git@github.com:darciew/bank_tech_test.git
$ cd bank_tech_test
```

Install the required Gems:
```
$ bundle install
```

Run RSpec to view tests:
```
$ bundle exec rspec
```
Run Rubocop to view code quality
```
$ bundle exec rubocop
```

## How to use in the Command Line:

```
2.5.1 :001 > require './lib/account_statement.rb'
 => true
2.5.1 :002 > require './lib/bank_account.rb'
 => true
2.5.1 :003 > statement = AccountStatement.new
 => #<AccountStatement:0x00007fbbf10ac850>
2.5.1 :004 > account = BankAccount.new(statement)
 => #<BankAccount:0x00007fbbf109e340 @balance=0, @statement=#<AccountStatement:0x00007fbbf10ac850>, @transactions=[]>
2.5.1 :005 > account.deposit(1000)
 => [{:credit=>1000, :balance=>1000}]
2.5.1 :006 > account.deposit(2000)
 => [{:credit=>1000, :balance=>1000}, {:credit=>2000, :balance=>3000}]
2.5.1 :007 > account.withdraw(500)
 => [{:credit=>1000, :balance=>1000}, {:credit=>2000, :balance=>3000}, {:debit=>500, :balance=>2500}]
2.5.1 :008 > account.view_statement
date || credit || debit || balance
09/11/2018 ||  || 500.00 || 2500.00
09/11/2018 || 2000.00 ||  || 3000.00
09/11/2018 || 1000.00 ||  || 1000.00
 ```
