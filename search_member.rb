require_relative 'registration'
class SearchMember
  def initialize(registration)
    @account_holder = registration.account_holder
  end
  def search_account_holder
    if @account_holder.empty?
      puts "-"*40
      puts "\nNo account holders registered yet."
      puts "-"*40
      return false
    else
      puts "-"*40
      print "Enter the customer id : "
      customer_id = gets.chomp.to_i
      puts "-"*40    
      account_details = @account_holder[customer_id]  
      if account_details
          puts "User Found"
          puts "-"*40      
          puts "Customer ID    : #{customer_id}"
          puts "Account Number : #{account_details[:account_number]}"
          puts "Full Name      : #{account_details[:full_name]}"
          puts "Age            : #{account_details[:age]}"
          puts "Phone Number   : #{account_details[:phone]}"
          puts "Aadhar Card    : #{account_details[:aadhar_card]}"
          puts "PAN Card       : #{account_details[:pan_card]}"
          puts "Address        : #{account_details[:address]}"
          puts "-" * 40
          return customer_id  
      else
          puts "Account not found!"
          return false
      end
      
    end
  end
end