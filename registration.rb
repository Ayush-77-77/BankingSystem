class Registration

  def initialize
    @account_holder = {}
  end
  
  def member_regsitration
    puts "\t\tEnter the account holder details"  
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
   account_holder = {
      full_name: full_name,
      age: age,
      phone: phone,
      aadhar_card: aadhar_card,
      pan_card: pan_card,
      address: address
    }
    @account_holder[phone] = account_holder
  end
  def get_all_account_holders
    @account_holder
  end
end