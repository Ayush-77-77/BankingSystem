require_relative 'registration'
require_relative 'search_member'
$transaction_id = 1000
$transactions = {}
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
        puts "4. Fund Transfer"
        puts "5. Transaction History"
        puts "5. Exit"
        puts "-"*40
        puts "Enter the value from 1 to 4"
        service_number = gets.chomp

        case service_number
        when '1'
          puts "Enter the deposit amount"
          deposit_amount = gets.chomp.to_f
          deposit(customer_id, deposit_amount)
        when '2'
          puts "Enter the withdrawal amount"
          withdrawal_amount = gets.chomp.to_f
          withdraw(customer_id, withdrawal_amount)
        when '3'
          account_balance(customer_id)
        when '4'
          fund_transfer()
        when '5'
          exit
        else
          puts "Wrong Input!! Please try a valid input from 1 to 4"
        end 
    else
        puts "No valid account found. Returning to dashboard."
    end
  end

  def deposit(customer_id, deposit_amount) 
    @account_transactions[customer_id][:account_balance] += deposit_amount
    @account_transactions[customer_id][:transaction_type][:credit] = deposit_amount

    puts "Deposited #{deposit_amount} into account number #{customer_id}. New balance: #{@account_transactions[customer_id][:account_balance]}"
    transaction_id = {
      from_customer: customer_id,
      to_customer: nil,
      status: "Success",
      message: "" 
    }
    $transactions[$transaction_id] = transaction_id
    $transaction_id +=1
  end

  def withdraw(customer_id,withdrawal_amount)
    
    if @account_transactions[customer_id][:account_balance] >= withdrawal_amount
      @account_transactions[customer_id][:account_balance] -= withdrawal_amount
      @account_transactions[customer_id][:transaction_type][:debit] = withdrawal_amount
      
      puts "Withdrew #{withdrawal_amount} from account number #{customer_id}. New balance: #{@account_transactions[customer_id][:account_balance]}"
      
      transaction_id = {
        from_customer: customer_id,
        to_customer: nil,
        status: "Success",
        message: "" 
      }
      $transactions[$transaction_id] = transaction_id
      $transaction_id +=1
      return true
    else
      puts "Insufficient balance!"
      transaction_id = {
        from_customer: customer_id,
        to_customer: nil,
        status: "Failed",
        message: "Inssfficient Balance" 
      }
      $transactions[$transaction_id] = transaction_id
      $transaction_id +=1
      return false
    end
  end

  def account_balance(customer_id)
    account_details = @account_holder[customer_id]  
    puts "-"*40      
    puts "Customer ID     : #{customer_id}"
    puts "Account Number  : #{account_details[:account_number]}"
    puts "Full Name       : #{account_details[:full_name]}"
    puts "Age             : #{account_details[:age]}"
    puts "Phone Number    : #{account_details[:phone]}"
    puts "Aadhar Card     : #{account_details[:aadhar_card]}"
    puts "PAN Card        : #{account_details[:pan_card]}"
    puts "Address         : #{account_details[:address]}"
    puts "-" * 40
    puts "Account Balance : #{@account_transactions[customer_id][:account_balance]}"
    puts "-" * 40
  end

  def fund_transfer
    print  "Enter the sender Customer Id : "
    from_customer_id = gets.chomp.to_i

    print  "Enter the receiver Customer Id : "
    to_customer_id = gets.chomp.to_i
    
    puts "Enter the amount : "
    amount = gets.chomp.to_f
    if withdraw(from_customer_id, amount)
      deposit(to_customer_id, amount)
    end
  end
  

end