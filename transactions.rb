

class Transactions
  def initialize(registration)
    @account_holder = registration.get_all_account_holders
    @account_number = {} # Initialize the account number storage
  end

  def transaction_services
    # Getting the account number from the search_member
    account_number = SearchMember.new(@account_holder).search_account_holder 
    if account_number
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
          deposit(account_number)
        when '2'
          withdraw(account_number)
        when '3'
          account_balance(account_number)
        when '4'
          exit
        else
          puts "Wrong Input!! Please try a valid input from 1 to 4"
        end 
    else
        puts "No valid account found. Returning to dashboard."
    end
  end

  def deposit(account_number)
    puts "Enter the deposit amount"
    deposit_amount = gets.chomp.to_f

  
    @account_holder[account_number][:account_balance] += deposit_amount
    puts "Deposited #{deposit_amount} into account number #{account_number}. New balance: #{@account_holder[account_number][:account_balance]}"

  end

  def withdraw(account_number)
    puts "Enter the withdrawal amount"
    withdrawal_amount = gets.chomp.to_f

    if @account_holder[account_number][:account_balance] >= withdrawal_amount
      @account_holder[account_number][:account_balance] -= withdrawal_amount
      puts "Withdrew #{withdrawal_amount} from account number #{account_number}. New balance: #{@account_holder[account_number][:account_balance]}"
    else
      puts "Insufficient balance!"
    end
  end

  def account_balance(account_number)
    puts "Account Number  : #{account_number}"
    puts "Account Balance : #{@account_holder[account_number][:account_balance]}"
  end
end
