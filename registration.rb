

class Registration
  attr_reader :account_holder, :account_transactions
  @@account_number_increment = 0
  def initialize  
    @account_holder = {}
    @account_transactions = {}
    
  end
  
  def member_registration
    puts "Enter the details for Account creation"  
    puts "-"*40
    print "Enter customer id : "
    customer_id = gets.chomp
    if (validate_customer_id(customer_id))
      customer_id = Integer(customer_id)
      print "Full Name : "
      full_name = gets.chomp
      print "Age : "
      age = gets.chomp
      print "Phone number : "
      phone = gets.chomp
      print "Aadhar Card Number : "
      aadhar_card = gets.chomp
      print "Pan Card Number : "
      pan_card = gets.chomp
      print "Full Address : "
      address = gets.chomp
     # calling account number generation
      account_number = account_number_generation  
      account_holder = {
        customer_id: customer_id,
        account_number: account_number,
        full_name: full_name,
        age: age,
        phone: phone,
        aadhar_card: aadhar_card,
        pan_card: pan_card,
        address: address
      }
      @account_holder[customer_id] = account_holder
      @account_transactions[customer_id]={
        account_number: account_number,
        account_balance: 0,
        transaction_type: { credit:0,
                            debit: 0} 

      }
      puts "-"*40
      puts "Account Created Successfull with the customer id #{customer_id} and account number #{account_number}"
      puts "-"*40
    end
  end

  def validate_customer_id(customer_id)
    # https://stackoverflow.com/questions/26013930/how-to-force-the-input-of-a-variable-to-be-an-integer-in-ruby
    isValid = false
    begin
      customer_id = Integer(customer_id)
      if @account_holder.key?(customer_id)
        puts "Customer id is already exits! Please enter a unique customer id"
        isValid = false
      else
        isValid = true
      end
    rescue 
      puts 'Not an integer ! Please try again to register with a valid customer id'
      isValid =  false
    end
    isValid # return value
  end

  def account_number_generation
    @@account_number_increment += 11
    default_initial_value = 999999
    return default_initial_value + @@account_number_increment
  end

end