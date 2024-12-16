class Registration
  def member_regsitration
    puts "\t\tEnter the account holder details"  
    print "Full Name : "
    @full_name = gets.chomp
    print "Age : "
    @age = gets.chomp
    print "Aadhar Card Number : "
    @aadhar_card = gets.chomp
    print "Pan Card Number : "
    @pan_card = gets.chomp
    print "Full Address : "
    @address = gets.chomp
  end
end