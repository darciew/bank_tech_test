# Bank Tech Test

## Technologies
Ruby

RSpec

## Task
A Bank Account Simulator in Ruby that can be run on the command line. Using RSpec for testing, it is designed to show my skills in TDD and OO design.

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

Command Line example:

New account:
```
2.5.1 :001 > require './lib/account_statement.rb'
 => true
2.5.1 :002 > require './lib/bank_account.rb'
 => true
2.5.1 :003 > account = BankAccount.new
 => #<BankAccount:0x00007f93521c7a40 @balance=0,
  @statement=#<AccountStatement:0x00007f93521c7a18
  @transactions=[]>>
```
Deposit:
```
2.5.1 :004 > account.deposit(-15)
Traceback (most recent call last):
3: from /Users/darciewalsh/.rvm/rubies/ruby-2.5.1/bin/irb:11:in `<main>'
2: from (irb):4
1: from /Users/darciewalsh/Projects/bank_tech_test/lib/bank_account.rb:13:in
 `deposit'
RuntimeError (Amount must be more than 0)
2.5.1 :005 > account.deposit(0)
 => [{:date=>"06/11/2018", :credit=>"-", :debit=>0, :balance=>0}]
2.5.1 :006 > account.deposit(20)
 => [{:date=>"06/11/2018", :credit=>"-", :debit=>0, :balance=>0},
  {:date=>"06/11/2018", :credit=>"-", :debit=>20, :balance=>20}]
2.5.1 :007 > account.deposit(40)
 => [{:date=>"06/11/2018", :credit=>"-", :debit=>0, :balance=>0},
  {:date=>"06/11/2018", :credit=>"-", :debit=>20, :balance=>20},
  {:date=>"06/11/2018", :credit=>"-", :debit=>40, :balance=>60}]
2.5.1 :008 > account.deposit(1000)
 => [{:date=>"06/11/2018", :credit=>"-", :debit=>0, :balance=>0},
  {:date=>"06/11/2018", :credit=>"-", :debit=>20, :balance=>20},
  {:date=>"06/11/2018", :credit=>"-", :debit=>40, :balance=>60},
  {:date=>"06/11/2018", :credit=>"-", :debit=>1000, :balance=>1060}]
```
Withdraw:
```
2.5.1 :011 > account.withdraw(60)
 => [{:date=>"06/11/2018", :credit=>"-", :debit=>0, :balance=>0},
  {:date=>"06/11/2018", :credit=>"-", :debit=>20, :balance=>20},
  {:date=>"06/11/2018", :credit=>"-", :debit=>40, :balance=>60},
  {:date=>"06/11/2018", :credit=>"-", :debit=>1000,
   :balance=>1060}, {:date=>"06/11/2018", :credit=>60, :debit=>"-",
   :balance=>1000}]

```
Statement:
```
2.5.1 :012 > account.view_statement
date || credit || debit || balance
06/11/2018 || - || 0 || 0
06/11/2018 || - || 20 || 20
06/11/2018 || - || 40 || 60
06/11/2018 || - || 1000 || 1060
06/11/2018 || 60 || - || 1000
```
