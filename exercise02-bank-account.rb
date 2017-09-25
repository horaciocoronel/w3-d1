class BankAccount
  @@interest_rate = 1.01
  @@accounts = []
  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def balance=(add)
    @balance = add
  end

  def deposit(number)
    @balance +=number
  end

  def withdraw(number)
    @balance -=number
  end

  def self.create
    @@accounts << BankAccount.new
    return @@accounts[-1]
  end

  def self.total_funds
    total_funds = 0
    @@accounts.each do | account |
      total_funds += account.balance
    end
    return total_funds
  end

  def self.interest_time
    @@accounts.each do | account |
    account.balance= (account.balance * @@interest_rate)
    end
  end
end

my_account = BankAccount.create
puts my_account.inspect
your_account = BankAccount.create
puts your_account.inspect
puts my_account.balance # 0
my_account.deposit(200)
puts BankAccount.total_funds # 0
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0

#when we use .self in a class method, we are bringing all the accounts from that class; then we can select balances of each account or elements from each account.
