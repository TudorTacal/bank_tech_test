### Bank tech test

## Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012 And a deposit of 2000 on 13-01-2012 And a withdrawal of 500 on 14-01-2012 When she prints her bank statement Then she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

## Instalation and use

* Download or clone the repository.
* Run ```bundle```
* Open *pry* or *irb*
```bank = Bank.new()
bank.add_credit(1000, '10/01/2012')
bank.add_credit(2000, '13/01/2012')
bank.withdraw_money(500, '14/01/2012')
bank.display_account_summary
```
* To see the tests run ```rspec``

## Approach

I wanted to quickly implement the basic functionality: add deposit, withdraw money and track a general balance. My plan was to start with one ```Bank``` class and then extract at least a ```Transaction``` class that would handle the balance history.

Due to the small blocks and the limited time I ended with one class that does everything, but the methods are slim and follow the *SRP* principle.

I am not very pleased with the presentation layer. The output is formed from very long strings and are not that dry. But The solution is working and is well tested.


##Contact
tudor.tacal@gmail.com
