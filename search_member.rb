class SearchMember
  def initialize(registration)
    @account_holder = registration.get_all_account_holders
  end
  def search_account_holder
    if @account_holder.empty?
      puts "-"*40
      puts "\nNo account holders registered yet."
      puts "-"*40
    else

      puts "-"*40
      print "Enter the Account number : "
      account_number = gets.chomp
      puts "-"*40      
      @account_holder.each do |account, details|
        if account == account_number
          puts "User Found"
          puts "-"*40      
          puts "Account Number : #{account}"
          puts "Full Name      : #{details[:full_name]}"
          puts "Age            : #{details[:age]}"
          puts "Phone Number   : #{details[:phone]}"
          puts "Aadhar Card    : #{details[:aadhar_card]}"
          puts "PAN Card       : #{details[:pan_card]}"
          puts "Address        : #{details[:address]}"
          puts "-" * 40
        end
      end
    end
  end
end