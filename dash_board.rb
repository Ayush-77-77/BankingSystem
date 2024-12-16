class DashBoard
  def dash_service
    puts "1. Registration"
    puts "2. Member details"
    puts "3. Search Member"
    puts "4. Transaction"
    puts "5. Exit"
    print "Please enter the value (1 to 5) : "
    service_number = gets.chomp   
    goto_service(service_number)
  end
  # private 
  def goto_service(service_number)
    case service_number
    when '1'
      registration = Registration.new
      registration.member_regsitration
    when '2'
      member_details = MemberDetails.new
      member_details.all_member_details
    when '3'
      serch_member = SearchMember.new
    when '4'
      transaction =  Transaction.new
    when '5'
      exti()
    else
      puts "Please enter a valid input"
    end
  end
end