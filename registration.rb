class Registration
  @@account_number_increment = ""
  def initialize
    @account_holder = {}
  end
  
  def member_regsitration
    puts "Enter the account holder details"  
    puts "-"*40
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
      acccount_number: account_number,
      full_name: full_name,
      age: age,
      phone: phone,
      aadhar_card: aadhar_card,
      pan_card: pan_card,
      address: address
    }
    @account_holder[account_number] = account_holder
  end
  def get_all_account_holders
    @account_holder
  end
  def account_number_generation
    @@account_number_increment =+ 11
    default_initial_value = 999999
    return default_initial_value + @@account_number_increment
  end

end