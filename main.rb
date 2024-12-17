require_relative 'dash_board'
require_relative 'authentication'
require_relative 'registration'
require_relative 'member_details'
require_relative 'search_member'
class Main
  

  def login()
    bank_employee = Authentication.new
    employee = bank_employee.user_authentication?("test@gmail.com", "test")

    # validate the employee for authentication
    if (employee == true)
      dashboard = DashBoard.new
      dashboard.dash_service
    else
      puts "Email or password is wrong"
    end
  end 


end


# start of a program
Main.new.login()  
  
