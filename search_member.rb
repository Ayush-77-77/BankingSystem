require_relative 'registration'
class SearchMember
  def initialize(registration)
    @account_holder = registration.get_all_account_holders
  end
  def search_account_holder
    if @account_holder.empty?
      puts "-"*40
      puts "\nNo account holders registered yet."
      puts "-"*40
      return nil
    
    else
      puts "-"*40
      print "Enter the Account number : "
      account_number = gets.chomp
      puts "-"*40    
      account_details = @account_holder[account_number.to_i]  
      if account_details
          puts "User Found"
          puts "-"*40      
          puts "Account Number : #{account_number}"
          puts "Full Name      : #{account_details[:full_name]}"
          puts "Age            : #{account_details[:age]}"
          puts "Phone Number   : #{account_details[:phone]}"
          puts "Aadhar Card    : #{account_details[:aadhar_card]}"
          puts "PAN Card       : #{account_details[:pan_card]}"
          puts "Address        : #{account_details[:address]}"
          puts "-" * 40
          return account_number
      
      else
          puts "Account not found!"
          return nil
      end
      
    end
  end
end