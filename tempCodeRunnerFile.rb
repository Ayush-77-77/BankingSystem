class DashBoard
  def initialize
    @registration = Registration.new  # Initialize the registration object once
  end
  def dash_service
    while(true)
      puts "-"*40
      puts "1. Registration"
      puts "2. Member details"
      puts "3. Search Member"
      puts "4. Transaction"
      puts "5. Exit"
      puts "-"*40
      print "Please enter the value (1 to 5) : " 
      service_number = gets.chomp  
      puts "-"*40
       
      
      break if(service_number == '5')
      
      go_to_service(service_number)
      
    end
  end
  
  def go_to_service(service_number)
      case service_number
      when '1'
        @registration.member_regsitration
      when '2'
        member_details = MemberDetails.new(@registration)
        member_details.display_all_members
      when '3'
        search_member = SearchMember.new(@registration)
        search_member.search_account_holder
      when '4'
        transaction =  Transactions.new(@registration)
        transaction.transaction_services
      when '5'
        exti()
      else
        puts "Please enter a valid input"
      end
     
  end
end