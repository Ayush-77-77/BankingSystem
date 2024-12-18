class MemberDetails
  
  def initialize(registration)
    
    @account_holder = registration.get_all_account_holders
  end

    def display_all_members()
      if @account_holder.empty?
        puts "-"*40
        puts "\nNo account holders registered yet."
        puts "-"*40
      else
        puts "-"*40
        puts "\nAll Registered Account Holders:\n\n"
        puts "-"*40
        @account_holder.each do |customer_id, details|
          puts "Customer ID    : #{customer_id}"
          puts "Account Number : #{details[:account]}"
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