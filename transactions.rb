require_relative 'registration'
require_relative 'search_member'

class Transactions
  def initialize(registration)
    @account_holder = registration.account_holder
    @account_transactions = registration.account_transactions # Initialize the account number storage
    @customer_id = SearchMember.new(registration)
  end

  def transaction_services
    
     customer_id = @customer_id.search_account_holder 
    if customer_id
        puts "-"*40
        puts "1. Deposit"
        puts "2. Withdraw"
        puts "3. Account balance"
        puts "4. Exit"
        puts "-"*40
        puts "Enter the value from 1 to 4"
        service_number = gets.chomp

        case service_number
        when '1'
          deposit(customer_id)
        when '2'
          withdraw(customer_id)
        when '3'
          account_balance(customer_id)
        when '4'
          exit
        else
          puts "Wrong Input!! Please try a valid input from 1 to 4"
        end 
    else
        puts "No valid account found. Returning to dashboard."
    end
  end

  def deposit(customer_id)
    puts "Enter the deposit amount"
    deposit_amount = gets.chomp.to_f

    
    @account_transactions[customer_id][:account_balance] += deposit_amount
    @account_transactions[customer_id][:transaction_type][:credit] = deposit_amount
    puts "Deposited #{deposit_amount} into account number #{customer_id}. New balance: #{@account_transactions[customer_id][:account_balance]}"

  end

  def withdraw(customer_id)
    puts "Enter the withdrawal amount"
    withdrawal_amount = gets.chomp.to_f

    if @account_transactions[customer_id][:account_balance] >= withdrawal_amount
      @account_transactions[customer_id][:account_balance] -= withdrawal_amount
      @account_transactions[customer_id][:transaction_type][:debit] = withdrawal_amount
      puts "Withdrew #{withdrawal_amount} from account number #{customer_id}. New balance: #{@account_transactions[customer_id][:account_balance]}"
    else
      puts "Insufficient balance!"
    end
  end

  def account_balance(customer_id)
    puts "Account Number  : #{customer_id}"
    puts "Account Balance : #{@account_transactions[customer_id][:account_balance]}"
  end
end
